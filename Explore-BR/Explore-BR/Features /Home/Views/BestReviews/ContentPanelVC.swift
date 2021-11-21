//
//  BestReviewsViewController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

class ContentPanelVC: UIViewController {
    
    private var tableView: MenuView?
    private var alert: Alert?
    private var latitude: Double?
    private var longitude: Double?
    private var controller: ContentPanelController = ContentPanelController()
    
    override func loadView() {
        self.tableView = MenuView()
        self.view = self.tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller.delegate(delegate: self)
        self.loadReviews()
    }
    
    private func configTableView() {
        self.tableView?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    private func loadReviews() {
        self.controller.loadReviews(latitude: self.latitude ?? 0, longitude: self.longitude ?? 0)
    }
    
    public func setLocationUser(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension ContentPanelVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.getCountElement()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BestReviewsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BestReviewsTableViewCell.identifier, for: indexPath) as? BestReviewsTableViewCell
        
        if indexPath.row == 1 {
            cell?.cardHeaderLabel.text = "Mais curtidos"
        }
        
        cell?.setupCell(cardList: self.controller.getListBestReviews())
        cell?.setCurrentNavigationController(navigation: self.navigationController)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.controller.getHeightCell())
    }
}


extension ContentPanelVC: ContentPanelControllerDelegate {
    func failureRequest(error: BestReviewErrors) {
        var msgError: String = ""
        switch error {
        case .failGetRequestServer:
            msgError = "Erro ao buscar os dados. Tente novamente."
        case .failsLoadList:
            msgError = "Erro ao carregar os dados. Tente novamente."
        }
        
        self.alert?.showAlert(title: "Erro", message: msgError, completion: nil)
    }
    
    func successRequest() {
        DispatchQueue.main.async {
            self.configTableView()
            self.tableView?.reloadData()
        }
    }
    
    func startLoading() {
        self.showSpinner()
    }
    
    func stopLoading() {
        self.removeSpinner()
    }
}

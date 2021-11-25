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
        self.controller.loadBestReviews(latitude: self.latitude ?? 0, longitude: self.longitude ?? 0)
        self.controller.loadMoreLiked(latitude: self.latitude ?? 0, longitude: self.longitude ?? 0)
    }
    
    public func setLocationUser(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension ContentPanelVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReviewsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ReviewsTableViewCell.identifier, for: indexPath) as? ReviewsTableViewCell
        cell?.setCurrentNavigationController(navigation: self.navigationController)
        
        if indexPath.row == 1 {
            cell?.setupCell(typeReview: .moreLiked, cardList: self.controller.getListMoreLiked())
            return cell ?? UITableViewCell()
        } else {
            cell?.setupCell(typeReview: .bestReview, cardList: self.controller.getListBestReviews())
            return cell ?? UITableViewCell()
        }
        
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
        
    }
    
    func stopLoading() {
        
    }
}

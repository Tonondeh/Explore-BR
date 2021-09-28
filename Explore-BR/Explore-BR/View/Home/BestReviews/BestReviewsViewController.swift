//
//  BestReviewsViewController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

class BestReviewsViewController: UIViewController {
    
    var menuView: MenuView?
    
    var list: [BestReview] = [BestReview(image: UIImage(named: "location-detail") ?? UIImage(), title: "Pernambuco", type: "Cidade", region: "Região 1", stars: [2.2, 5, 2, 4, 1]), BestReview(image: UIImage(named: "location-detail") ?? UIImage(), title: "Guarujá", type: "Praia", region: "Regiao 2", stars: [2.2, 5, 2, 4, 1]), BestReview(image: UIImage(named: "location-detail") ?? UIImage(), title: "Recife", type: "Cidade1", region: "Não sei", stars: [2.2, 5, 2, 4, 1])]
    
    override func loadView() {
        self.menuView = MenuView()

        self.view = self.menuView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuView?.configTableViewProtocols(delegate: self, dataSource: self)
    }

}

extension BestReviewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BestReviewsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BestReviewsTableViewCell.identifier, for: indexPath) as? BestReviewsTableViewCell
        
        cell?.setupCell(cardList: self.list)
        cell?.setCurrentNavigationController(navigation: self.navigationController)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

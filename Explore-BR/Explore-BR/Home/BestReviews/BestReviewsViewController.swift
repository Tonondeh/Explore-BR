//
//  BestReviewsViewController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

class BestReviewsViewController: UIViewController {
    
    var menuView: MenuView?
    
    var list: [BestReview] = [BestReview(image: UIImage(systemName: "person.fill") ?? UIImage(), title: "Pernambuco", type: "Cidade", region: "Região 1"), BestReview(image: UIImage(systemName: "person.fill") ?? UIImage(), title: "Guarujá", type: "Praia", region: "Regiao 2"), BestReview(image: UIImage(systemName: "person.fill") ?? UIImage(), title: "Recife", type: "Cidade1", region: "Não sei")]
    
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
        
//        cell?.setupCell(data: self.list[indexPath.row])
        cell?.setupCell(cardList: self.list)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

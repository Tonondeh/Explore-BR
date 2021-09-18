//
//  BestReviewsViewController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

class BestReviewsViewController: UIViewController {
    
    
    @IBOutlet weak var bestReviewsTableView: UITableView!
    
    var list: [BestReview] = [BestReview(testImage: UIImage(systemName: "person.fill") ?? UIImage())]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTableView()
    }
    
    private func configTableView() {
        self.bestReviewsTableView?.delegate = self
        self.bestReviewsTableView?.dataSource = self
        self.bestReviewsTableView?.backgroundColor = .red
        
        self.bestReviewsTableView?.register(BestReviewsTableViewCell.nib(), forCellReuseIdentifier: BestReviewsTableViewCell.identifier)
    }

}

extension BestReviewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BestReviewsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BestReviewsTableViewCell.identifier, for: indexPath) as? BestReviewsTableViewCell
        
        cell?.setupCell(data: self.list[indexPath.row])
        
        cell?.textLabel?.text = "blablabla"
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

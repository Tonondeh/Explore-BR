//
//  ViewTable.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

class MenuView: UIView {
    
    lazy var bestReviewsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.separatorStyle = .none
        
        tableView.register(BestReviewsTableViewCell.nib(), forCellReuseIdentifier: BestReviewsTableViewCell.identifier)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.bestReviewsTableView.delegate = delegate
        self.bestReviewsTableView.dataSource = dataSource
    }
    
    func addSubview() {
        self.addSubview(self.bestReviewsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.bestReviewsTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.bestReviewsTableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 30),
            self.bestReviewsTableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -30),
            self.bestReviewsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}

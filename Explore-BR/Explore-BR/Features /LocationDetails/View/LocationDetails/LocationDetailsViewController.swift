//
//  LocationDetailsViewController.swift
//  Explore-BR
//
//  Created by Ederson on 25/08/21.
//

import UIKit

class LocationDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var controller: LocationDetailsController = LocationDetailsController()
    
    // Detalhes do local
    var placeDetail = PlaceDetail(placeIid: "1", photo:UIImage(named:"location-detail") ?? UIImage(), name: "Parque Serra do Curral", description: "Localizado em uma área aproximada de 400 mil metros quadrados, o Parque possui 10 mirantes distribuídos por seus quatro mil metros de extensão, de onde o visitante pode identificar pontos turísticos da cidade e aspectos naturais de seu entorno, como a Lagoa da Pampulha, o Parque Municipal Américo Renné Giannetti, a Avenida Afonso Pena, o Estádio Mineirão, o Museu de História Natural e o Jardim Botânico da UFMG, o Pico do Itabirito, a Serra da Piedade, o Morro do Pires, o Morro do Elefante, o Parque Estadual da Serra do Rola-Moça, entre outros.", quantityEvaluations: 1234)
    
    // Avaliações do local
    var listReviews:[PlaceReview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addReview()
        self.configNavigationBar()
        self.configTableView()
        self.controller.delegate(delegate: self)
        self.controller.loadLocation()
    }
    
    private func addReview(){
        self.listReviews.append(PlaceReview())
        
        self.listReviews.append(PlaceReview(reviewImage: "location-detail-1", name: "Ederson Dias Silva", title: "O local é ótimo", review: "Ótimo local para fazer atividades físicas.", stars:5))
        
        self.listReviews.append(PlaceReview(reviewImage: "location-detail-2", name: "Katty Loaiza", title: "Local silencioso", review: "Bom local para descansar a mente.", stars:5))
        
        self.listReviews.append(PlaceReview(reviewImage: "location-detail-3", name: "Walter Casagrande", title: "Bom local pra levar a família", review: "Bom local pra levar a família.", stars:5))
        
        self.listReviews.append(PlaceReview(reviewImage: "location-detail-1", name: "Ederson Dias Silva", title: "O local é ótimo", review: "Ótimo local para fazer atividades físicas.", stars:5))
        
        self.listReviews.append(PlaceReview(reviewImage: "location-detail-2", name: "Katty Loaiza", title: "Local silencioso", review: "Bom local para descansar a mente.", stars:5))
        
        self.listReviews.append(PlaceReview(reviewImage: "location-detail-3", name: "Walter Casagrande", title: "Bom local pra levar a família", review: "Bom local pra levar a família.", stars:5))
        
    }
    
    private func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.title = "Mais Informações"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    private func configNavigationBar() {
        
        let layer0 = CAGradientLayer()
        
        layer0.colors = [
            
            UIColor(red: 0.204, green: 0.58, blue: 0.902, alpha: 1).cgColor,
            
            UIColor(red: 0.925, green: 0.431, blue: 0.678, alpha: 1).cgColor
            
        ]
        
        if let colors = layer0.colors {
            self.navigationController?.navigationBar.setGradientBackground(colors: colors)
        }
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }

}

extension LocationDetailsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            self.tableView.register(LocationDetailsTableViewCell.nib(), forCellReuseIdentifier: LocationDetailsTableViewCell.identifier)
            
            guard let cell:LocationDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: LocationDetailsTableViewCell.identifier, for: indexPath) as? LocationDetailsTableViewCell else{ return UITableViewCell() }
            
            let placeDetail = self.placeDetail
            cell.currentNavigation = self.navigationController
            cell.setupCell(place:placeDetail)
            
            return cell
        }else{
            self.tableView.register(ReviewTableViewCell.nib(), forCellReuseIdentifier: ReviewTableViewCell.identifier)
            
            guard let cell:ReviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else{ return UITableViewCell() }
            cell.setupCell(review: self.listReviews[indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 700
        }else{
            return 100
        }
    }
    
}

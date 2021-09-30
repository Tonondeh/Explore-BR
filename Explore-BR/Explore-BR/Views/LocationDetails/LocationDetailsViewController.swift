//
//  LocationDetailsViewController.swift
//  Explore-BR
//
//  Created by Ederson on 25/08/21.
//

import UIKit

class LocationDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()
        self.configTableView()
    }
    
    private func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(LocationDetailsTableViewCell.nib(), forCellReuseIdentifier: LocationDetailsTableViewCell.identifier)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:LocationDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: LocationDetailsTableViewCell.identifier, for: indexPath) as? LocationDetailsTableViewCell else{ return UITableViewCell() }
        
        let placeDetail = PlaceDetail(photo:UIImage(named:"location-detail") ?? UIImage(), name: "Parque Serra do Curral", description: "Localizado em uma área aproximada de 400 mil metros quadrados, o Parque possui 10 mirantes distribuídos por seus quatro mil metros de extensão, de onde o visitante pode identificar pontos turísticos da cidade e aspectos naturais de seu entorno, como a Lagoa da Pampulha, o Parque Municipal Américo Renné Giannetti, a Avenida Afonso Pena, o Estádio Mineirão, o Museu de História Natural e o Jardim Botânico da UFMG, o Pico do Itabirito, a Serra da Piedade, o Morro do Pires, o Morro do Elefante, o Parque Estadual da Serra do Rola-Moça, entre outros.", quantityEvaluations: 390)
        
        cell.setupCell(place:placeDetail)
        
        return cell
    }
}

//
//  SearchController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 14/11/21.
//

import Foundation
import UIKit

class SearchController {
    
    var newData: [Place] = []
    var resultPlaceSearch: [Place] = []
    
    var placeTypes: [Place] = [Place(name: "Parques", placeButtonEnable: true, id: "1"),Place(name: "Restaurantes", placeButtonEnable: false, id: "2"), Place(name: "Shopping", placeButtonEnable: false, id: "3"), Place(name: "Cinema", placeButtonEnable: false, id: "4"), Place(name: "Zoologico", placeButtonEnable: false, id: "5")]
    
    var placeList:[Place] = [
        Place(name: "cascata do osvaldo", image: UIImage(named: "location-detail") ?? UIImage(), localType: "wwwwww", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 4.4, id: "1"),
        Place(name: "cascata do caracol",image: UIImage(named: "location-detail") ?? UIImage(), localType: "restaurantes", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 2.5, id: "2"),
        Place(name: "cachoeira", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 5.0, id: "3"),Place(name: "lalalalal", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 5.0, id: "3")
    ]
    
    public func numberOfPlaces() -> Int {
        return self.placeTypes.count
    }
    
    public func indexPathOfPlaces(indexPath: IndexPath) -> Place {
        return self.placeTypes[indexPath.row]
    }
    
    public func indexPathOfPlaceList(indexPath: IndexPath) -> Place {
        return self.placeList[indexPath.row]
    }
    
    public func didSelectItemWith(indexPath: IndexPath) {
        self.filterBy(name: self.placeList[indexPath.row].name ?? "")
    }
    
    func filterBy(name: String) {
        let searchLower = name.lowercased()
        
        newData = self.placeList.filter {
            let filterBy = $0.localType?.lowercased()
            return filterBy?.lowercased().contains(searchLower) ?? true
        }
        
        print("data", newData)
        
        resultPlaceSearch = newData
        
        print("resultPlaceSearch", resultPlaceSearch)
    }
    
    func searchPlaceWith(searchText: String) {
        let searchLower = searchText.lowercased()
        
        newData = self.placeList.filter {
            let filterBy = $0.name?.lowercased()
            return filterBy?.lowercased().contains(searchLower) ?? true
        }
        
        
        resultPlaceSearch = newData
    }
    
}

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
    
    var placeTypes: [Place] = []
    
    var placeList:[Place] = [
        
//        PlaceGoogleResponse(businessStatus: "", icon: <#T##String?#>, iconBackgroundColor: <#T##String?#>, iconMaskBaseURI: <#T##String?#>, name: <#T##String?#>, photos: <#T##[String]?#>, placeID: <#T##String?#>, rating: <#T##Double?#>, reference: <#T##String?#>, types: <#T##[String]?#>, userRatingsTotal: <#T##Int?#>, vicinity: <#T##String?#>)
        
        
//        Place(name: "cascata do osvaldo", image: UIImage(named: "location-detail") ?? UIImage(), localType: "wwwwww", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 4.4, id: "1"),
//        Place(name: "cascata do caracol",image: UIImage(named: "location-detail") ?? UIImage(), localType: "restaurantes", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 2.5, id: "2"),
//        Place(name: "cachoeira", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 5.0, id: "3"),Place(name: "lalalalal", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 5.0, id: "3")
    ]
    
    let searchRecents: [Place] = []
    
    public func numberOfPlaces() -> Int {
        return self.placeTypes.count
    }
    
    public func numberOfRecentSearches() -> Int {
        return self.searchRecents.count
    }
    
    public func indexPathOfPlaces(indexPath: IndexPath) -> Place {
        return self.placeTypes[indexPath.row]
    }
    
    public func indexPathOfRecentSearches(indexPath: IndexPath) -> Place {
        return self.searchRecents[indexPath.row]
    }
    
    public func indexPathOfPlaceList(indexPath: IndexPath) -> Place {
        return self.placeList[indexPath.row]
    }
    
    public func didSelectItemWith(indexPath: IndexPath) {
        self.filterBy(name: self.placeList[indexPath.row].name ?? "")
    }
    
    func filterBy(name: String) {
        let searchLower = name.lowercased()
        
//        newData = self.placeList.filter {
//            let filterBy = $0.localType?.lowercased()
//            return filterBy?.lowercased().contains(searchLower) ?? true
//        }
//
//        print("data", newData)
//
//        resultPlaceSearch = newData
        
        print("resultPlaceSearch", resultPlaceSearch)
    }
    
    func getPlaceWith(name: String) {
        SearchWorker.shared.search(by: name) { place, error in
            if let _error = error {
                debugPrint(_error.localizedDescription)
            } else {
                guard let _place = place else { return }
                
                var placeFormatted: Place
                
                for value in _place.results {
                    placeFormatted = Place(name: value.name, placeButtonEnable: true, image: UIImage(named: value.photos[0].photoReference) ?? UIImage(), localType: value.vicinity, local: value.vicinity, description: value.vicinity, heartIconEnable: true, heartIcon: UIImage(systemName: "heart") ?? UIImage(), star: 4.0, icon: UIImage(named: value.icon) ?? UIImage(), address: value.vicinity, id: value.placeID)
                    
                    debugPrint("place ==", placeFormatted)
                    
                    self.newData.append(placeFormatted)
                    self.resultPlaceSearch.append(placeFormatted)
                }
            }
        }
    }
    
    func searchPlaceWith(searchText: String) {
        let searchLower = searchText.lowercased()
        
        if searchLower == "" { return }
        
        self.getPlaceWith(name: searchLower)
        
//        newData = self.placeList.filter {
//            let filterBy = $0.name?.lowercased()
//            return filterBy?.lowercased().contains(searchLower) ?? true
//        }
        
        
//        resultPlaceSearch = newData
    }
    
}

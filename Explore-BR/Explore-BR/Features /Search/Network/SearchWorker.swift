//
//  SearchWorker.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 13/11/21.
//
import Foundation
import Alamofire
//import CoreLocation

class SearchWorker {
    
    static let shared = SearchWorker()
    
    var photosArray: [String] = []
    
    func search(by: String, completion: @escaping(_ place: PlaceGoogle?, _ error: Error?) -> Void) {
        let key = "AIzaSyDJQUubD6DQxsmwXi-JsuisstKvLWM4VY0"
        
        let baseUrl = "\(API.baseUrl)nearbysearch/json?location=-19.9695407,-44.0509203&radius=20000&key=\(key)"
        
        AF.request(baseUrl).responseJSON { response in
            
            guard let data = response.data else { return }
            
            if let status = response.response?.statusCode {
                
                if status == 200 {
                    do {
                        let placeModel: PlaceGoogle = try JSONDecoder().decode(PlaceGoogle.self, from: data)
                        debugPrint("placeModel ====", placeModel)
                        
                        completion(placeModel, nil)
                    } catch {
                        debugPrint("Error =>", error)
                        completion(nil, error)
                    }
                } else {
                    debugPrint("error with response status: \(status)")
                    completion(nil, nil)
                }
            }
            
            
            guard let data = response.data else { return }
            
            
            do {
                let placeModel: PlacesGoogle = try JSONDecoder().decode(PlacesGoogle.self, from: data)
                debugPrint("placeModel ====", placeModel)
                
                completion(placeModel, nil)
            } catch {
                debugPrint("Error =>", error)
                completion(nil, error)
            }
        }
        
    }
    
    //    func getCurrentLocation() -> NSDictionary {
    //        let location = CLLocation()
    //
    //        var locationObject: [String:Any]
    //        return locationObject as NSDictionary
    //
    //        locationObject["latitude"] = location.coordinate.latitude as Double?
    //
    //    }
    
}

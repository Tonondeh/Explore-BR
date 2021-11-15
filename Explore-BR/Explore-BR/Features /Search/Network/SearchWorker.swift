//
//  SearchWorker.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 13/11/21.
//

import Foundation
import Alamofire
import CoreLocation

class SearchWorker {
    
    func search(by: String, completion: @escaping(_ place: PlaceGoogleResponse?, _ error: Error? ) -> Void) {
//        let parameters = ["location": "-19.9695407,-44.0509203", "radius": "20000"]
        
        let baseUrl = "\(API.baseUrl)nearbysearch/json?location=-19.9695407,-44.0509203&radius=20000"
        
        guard let url: URL = URL(string: baseUrl) else { return }
        
        var urlRequest:URLRequest = URLRequest(url: url as URL)
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        AF.request(urlRequest).responseJSON { response in
            if response.response?.statusCode == 200 {
                
                if let data = response.data {
                    
                    do {
//                        let data = try JSONDecoder().decode(PlaceGoogleResponse.self, from: data)
                        let dataJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        guard let dataFormatted = dataJson as? PlaceGoogleResponse else { return }
                        
                        completion(dataFormatted, nil)
                        
                    } catch {
                        
                        debugPrint(error)
                        completion(nil, error)
                        
                    }
                    
                }
                
            }
        }
        
    }
    
//    func getCurrentLocation() -> NSDictionary {
//        let location = CLLocation()
//
//        var locationObject: [String:Any]
//
////        locationObject["latitude"] = location.coordinate.latitude as Double?
//
//    }
    
}

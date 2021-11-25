//
//  LocationDetailsWorker.swift
//  Explore-BR
//
//  Created by Ederson on 24/11/21.
//

import Foundation
import Alamofire

class LocationDetailsWorker{
    
    func loadLocation(completion:@escaping(_ success: PlaceDetail?, _ error: NSError?) -> Void){
        let urlString:String = "https://run.mocky.io/v3/ad09126e-a54d-4a4f-a153-45e4fca4dabc"
        guard let url: URL = URL(string: urlString) else {return}
        var urlRequest:URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        AF.request(urlRequest).responseJSON{ response in
            print("response")
            print(response.result)
            
            if response.response?.statusCode == 200{
                do {
                    if let _data = response.data{
                        let place:PlaceDetail = try JSONDecoder().decode(PlaceDetail.self, from: _data)
                        completion(place, nil)
                    }
                } catch{
                    completion(nil, response.error as NSError?)
                }
                
            }else{
                print(response.error)
                completion(nil, response.error as NSError?)
            }
        }
    }
}

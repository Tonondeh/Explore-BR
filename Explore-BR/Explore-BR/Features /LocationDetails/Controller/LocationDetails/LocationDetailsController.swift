//
//  LocationDetails.swift
//  Explore-BR
//
//  Created by Ederson on 24/11/21.
//

import Foundation

protocol LocationDetailsControllerDelegate:AnyObject {
    func successAllRequest()
    func errorRequest()
}

class LocationDetailsController{
    
    private var location:PlaceDetail?
    
    private weak var delegate:LocationDetailsControllerDelegate?
    public func delegate(delegate:LocationDetailsControllerDelegate?){
        self.delegate = delegate
    }
    
    public func countElemented() -> Int{
        return self.location?.placeList?.count ?? 0
    }
    
    public func getElemented(indexPath:IndexPath)-> HistoryAccountList{
        return self.location?.placeList?[indexPath.row] ?? PlaceList()
    }
    
    public func getHeightCell() -> CGFloat{
        return 100
    }

    public func loadLocation(){
        
        LocationDetailsWorker().loadLocation { success, error in
            if success != nil{
                self.location = success
                self.delegate?.successAllRequest()
            }else{
                self.delegate?.errorRequest()
            }
        }
    }
    
}

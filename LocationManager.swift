//
//  LocationManager.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 12/3/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationManagerDelegate: class {
    func titleLocationUpdated()
}

class LocationManager: CLLocationManager {
    
    private override init(){ super.init() }
    
    static let sharedInstance  = LocationManager()
    
    weak var ViewContollerDelegate: LocationManagerDelegate?
    
    var currentLocation: String? = " "
    
    func getCurrentLocation(){
        
        let blockOperation: BlockOperation =  BlockOperation(block: {[weak self ] in
            
            CLGeocoder().reverseGeocodeLocation(LocationManager.sharedInstance.location!, completionHandler: {[weak self](placemarks, error) in
               
                if error != nil {
                    fatalError("Reverse geocoder failed with error \(String(describing: error?.localizedDescription))!")
                }
                if placemarks!.count > 0 {
                    self?.currentLocation = placemarks![0].locality!
                    self!.ViewContollerDelegate?.titleLocationUpdated()
                }
                else {
                    print("Problem with the data received from geocoder")
                }
            })
        })
        blockOperation.qualityOfService = .background
        OperationQueue.main.addOperation(blockOperation)
    }
    
    
}

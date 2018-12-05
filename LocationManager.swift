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
    func networkLocationUpdated()
}

class LocationManager: CLLocationManager, CLLocationManagerDelegate {
    
    private override init(){
        super.init()
        self.delegate = self
    }
    
    static let sharedInstance  = LocationManager()
    
    weak var ViewContollerDelegate: LocationManagerDelegate?
    
    var currentLocation: String? = ""
    
    var authorizationStatus: Bool = {
        CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways
    }()
    
    func updateCurrentLocation(){
        let blockOperation: BlockOperation = BlockOperation(block: { [weak self] in
        let currentLocation: CLLocation = self!.location!
        NetworkManager.sharedInstance.darkSkyLocation = "\(String(format:"%0.4f",currentLocation.coordinate.latitude)),\(String(format:"%0.4f",currentLocation.coordinate.longitude))"
        })
        blockOperation.qualityOfService = .userInteractive
        blockOperation.completionBlock = { [weak self] in
            self!.ViewContollerDelegate?.networkLocationUpdated()
        }
        OperationQueue.main.addOperation(blockOperation)
    }
    
    func updateCurrentLocationName(){
        
        let blockOperation: BlockOperation =  BlockOperation(block: {[weak self ] in

            CLGeocoder().reverseGeocodeLocation((self?.location!)!, completionHandler: {[weak self](placemarks, error) in
               
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
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        switch status {
        case .notDetermined:
            self.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            //self.startUpdatingLocation()
            updateCurrentLocation()
            updateCurrentLocationName()
            break
        case .authorizedAlways:
            //self.startUpdatingLocation()
            updateCurrentLocation()
            updateCurrentLocationName()
            break
        case .restricted:
            // restricted by e.g. parental controls. User can't enable Location Services
            break
        case .denied:
            // user denied your app access to Location Services, but can grant access from Settings.app
            break
        default:
            break
        }
    }

}

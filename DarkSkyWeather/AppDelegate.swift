//
//  AppDelegate.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let locationManager: LocationManager = LocationManager.sharedInstance
      
        let locationOperation: BlockOperation = BlockOperation { [weak locationManager] in
            locationManager?.requestWhenInUseAuthorization()
        }
        locationOperation.completionBlock = { [weak locationManager] in
            if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() ==  .authorizedAlways){
                let currentLocation: CLLocation = locationManager!.location!
                NetworkManager.sharedInstance.darkSkyLocation = "\(String(format:"%0.4f",currentLocation.coordinate.latitude)),\(String(format:"%0.4f",currentLocation.coordinate.longitude))"
            }
            else{
                fatalError("Failed to obtain location usage authorization")
            }
        }
        locationOperation.qualityOfService = .userInteractive
        OperationQueue.main.addOperation(locationOperation)
   
        return true
    }

}


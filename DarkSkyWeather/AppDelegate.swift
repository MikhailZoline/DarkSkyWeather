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
        let _: LocationManager = LocationManager.sharedInstance
      
//        let locationOperation: BlockOperation = BlockOperation { [weak locationManager] in
//            locationManager?.requestWhenInUseAuthorization()
//        }
//        locationOperation.qualityOfService = .userInteractive
//        OperationQueue.main.addOperation(locationOperation)
   
        return true
    }

}


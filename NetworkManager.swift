//
//  NetworkService.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/27/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import Foundation
import CoreLocation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
}

public typealias NetworkRequestCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

class NetworkManager {
    static let DarkSkyAPIKey: String = "59c6b6b7efd5c3fc0f617338cfae6c48"
    static let DarkSkyURL: String = "https://api.darksky.net/forecast"
    var Location: String = "37.8267,-122.4233"

    var darkSkyLocation: String {
        get {
            return Location
        }
        set{
            Location  = newValue
        }
    }
    
    private var task: URLSessionTask?
    
    private init(){

    }
    static let sharedInstance = NetworkManager()
    
    func request(_ completion: @escaping NetworkRequestCompletion) {
        
        let stringURL: String = NetworkManager.DarkSkyURL + "/" + NetworkManager.DarkSkyAPIKey + "/" + darkSkyLocation
        let session = URLSession.shared
        
        guard let url = URL(string: stringURL) else{
            fatalError("Failed to create URL with \(stringURL)" )
        }
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        self.task = session.dataTask(with: request, completionHandler: { data, response, error in
            completion(data, response, error)
        })

        self.task?.resume()
    }
    
    func getDailyWeather(completion: @escaping (_ currently: currently? ,_ weatherSummary: [daily]?,_ error: String?)->()){
        self.request { ( data, response, error) in
            if error != nil {
                completion(nil, nil, "Please check your network connection.")
            }
             if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
//                        print(responseData)
                        let responseJSON: DarkSkyJsonResponse = try JSONDecoder().decode(DarkSkyJsonResponse.self, from : responseData)
//                        print(responseJSON.daily.data.debugDescription)
                        OperationQueue.main.addOperation({
                            completion( responseJSON.currently, responseJSON.daily.data,nil)
                        })
                    }catch {
                        print("Failed to Initialize JSON object \(error)")
                        completion(nil, nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, nil, networkFailureError)
                }
            }
        }
    }
}

//
//  DataSource.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol TweetsDataSourceProtocol {
    func getToken(completion: @escaping (String?) -> Void)
    func getTweets(from searchText: String, count: Int, type: String, completion: @escaping ([Tweet]?) -> Void)
}


class TweetsDataSource : TweetsDataSourceProtocol {
    
    private var token : String {
        return UserDefaults.standard.string(forKey: Constants.token) ?? ""
    }
    
    internal func getToken(completion: @escaping (String?) -> Void) {
        
        let apiSecretAndKey = Env().config(PlistKey.TWITTER_API_KEY) + ":" + Env().config(PlistKey.TWITTER_API_APPSECRET)
        
        let apiSecretAndKeyEncoded = apiSecretAndKey.data(using: String.Encoding.utf8)!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        let headers = [
            "Authorization" : "Basic \(apiSecretAndKeyEncoded)",
            "Content-Type": Constants.contentType
        ]
        
        let body: [String : AnyObject] = ["grant_type": Constants.getCreds as AnyObject]
        let url = Env().config(PlistKey.BASE_URL) + Endpoint.getToken.rawValue
        
        APIManager.shared.post(url: url, headers: headers, parameters: body) { response in
            switch response {
            case .success(let received):
                if let accessToken = received[Constants.token] as? String {
                    completion(accessToken)
                    UserDefaults.standard.set(accessToken, forKey: Constants.token)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    internal func getTweets(from searchText: String, count: Int, type: String, completion: @escaping ([Tweet]?) -> Void) {
        let url = Env().config(PlistKey.BASE_URL) + Constants.tweetsEndPoint + "q=\(searchText)" + "&count=\(count)" + "&result_type=\(type)"
        
        let headers : HeaderParams = [
            "Authorization" : "Bearer " + self.token
        ]
        
        APIManager.shared.get(from: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!,
                              headers: headers,
                              parameters: nil) { (response) in
            
            switch response {
            case .success(let results):
                if let statuses = results["statuses"] as? Array<Dictionary<String,Any>> {
                    var tweetsArray = [Tweet]()
                    tweetsArray.removeAll()
                    for tweet in statuses {
                        let tweetObject = Tweet(from: JSON(tweet))
                        tweetsArray.append(tweetObject)
                    }
                    completion(tweetsArray)
                }
            case .failure(let error):
                print("ERROR in results: ",error)
                completion(nil)
            }
            
        }
    }
    
}

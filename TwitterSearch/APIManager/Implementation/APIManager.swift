//
//  APIManager.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 11/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation
import Alamofire

public final class APIManager : APIManagerProtocol {
    
    public static let shared = APIManager()
    
    private init() { }
    
    func post(url: String, headers: HeaderParams, parameters: APIParams, onCompletion: @escaping onCompletionAPICall) {
        
        Alamofire.request(url,
                          method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                            switch response.result {
                            case .success(let dict):
                                if let dictionary = dict as? [String:Any] {
                                    onCompletion(Response.success(dictionary))
                                }
                            case .failure(let error):
                                let errorDict : [String:Any] = ["Error":error.localizedDescription]
                                onCompletion(Response.failure(errorDict))
                            }

        }
    }
    
    func get(from url: String, headers: HeaderParams, parameters: APIParams, onCompletion: @escaping onCompletionAPICall) {
        
        Alamofire.request(url,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let dict):
                    if let dictionary = dict as? [String:Any] {
                        onCompletion(Response.success(dictionary))
                    }
                case .failure(let error):
                    let errorDict : [String:Any] = ["Error":error.localizedDescription]
                    onCompletion(Response.failure(errorDict))
                }
                
        }
        
    }
}

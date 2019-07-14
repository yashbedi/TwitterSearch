//
//  APIManagerProtocol.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 11/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum Response<T> {
    case success(T)
    case failure(T)
}

typealias APIParams = [String : AnyObject]?
typealias HeaderParams = [String: String]?
typealias onCompletion =  (Response<JSON>) -> Void
typealias onCompletionAPICall = (Response<[String:Any]>) -> Void

protocol APIManagerProtocol {
    func post(url: String, headers: HeaderParams, parameters: APIParams, onCompletion: @escaping onCompletionAPICall)
    func get(from url: String, headers: HeaderParams, parameters: APIParams,  onCompletion: @escaping onCompletionAPICall)
}

//
//  Endpoints.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 11/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation


public enum Endpoint: String {
    
    case getToken = "/oauth2/token"
    case searchTweets = "/1.1/search/tweets.json?q="
    
}

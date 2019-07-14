//
//  Environment.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 11/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation

public enum PlistKey {
    case APP_NAME
    case APP_COLOR
    case APP_VERSION
    case BUNDLE_IDENTIFIER
    case BASE_URL
    case BUILD_NUMBER
    case TWITTER_API_KEY
    case TWITTER_API_APPSECRET
    
    func value() -> String {
        switch self {
        case .APP_NAME              : return "APP_NAME"
        case .APP_COLOR             : return "APP_COLOR"
        case .APP_VERSION           : return "APP_VERSION"
        case .BUNDLE_IDENTIFIER     : return "BUNDLE_IDENTIFIER"
        case .BASE_URL              : return "BASE_URL"
        case .BUILD_NUMBER          : return "BUILD_NUMBER"
        case .TWITTER_API_KEY       : return "TWITTER_API_KEY"
        case .TWITTER_API_APPSECRET : return "TWITTER_API_APPSECRET"
        }
    }
}

public struct Env {
    fileprivate var infoDict: [String: Any] {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
    public func config(_ key: PlistKey) -> String {
        switch key {
        case .APP_NAME              : return infoDict[PlistKey.APP_NAME.value()] as! String
        case .APP_COLOR             : return infoDict[PlistKey.APP_COLOR.value()] as! String
        case .APP_VERSION           : return infoDict[PlistKey.APP_VERSION.value()] as! String
        case .BUNDLE_IDENTIFIER     : return infoDict[PlistKey.BUNDLE_IDENTIFIER.value()] as! String
        case .BASE_URL              : return "https://" + (infoDict[PlistKey.BASE_URL.value()] as! String)
        case .BUILD_NUMBER          : return infoDict[PlistKey.BUILD_NUMBER.value()] as! String
        case .TWITTER_API_KEY       : return infoDict[PlistKey.TWITTER_API_KEY.value()] as! String
        case .TWITTER_API_APPSECRET : return infoDict[PlistKey.TWITTER_API_APPSECRET.value()] as! String
        }
    }
}

//
//  Constants.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 11/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation



struct Constants {
    
    // MARK : App Specific
    static let isoDateFormat : String = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let whenJoinedFormat : String = "MMMM YYYY"
    static let twitterDateFormat : String = "EEE MMM dd HH:mm:ss Z yyyy"
    static let dummyLabel : String = "Try searching for people, topics,\nor keywords"
    static let tweetWithOutImage : String = "TweetWithOutImage"
    static let tweetWithImageCell : String = "TweetWithImageCell"
    static let profileVC : String = "ProfileViewController"
    
    // MARK : Network aka Api Related
    static let tweetsEndPoint : String = "/1.1/search/tweets.json?"
    static let contentType : String = "application/x-www-form-urlencoded;charset=UTF-8"
    static let token : String = "access_token"
    static let getCreds : String = "client_credentials"
    
}

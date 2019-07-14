//
//  Tweets.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    
    var tweetCreatedAt : String
    var text : String
    var name : String
    var screenName : String
    var tweetMediaUrl : String
    var coverImageUrl : String
    var profileImageUrl : String
    var verifiedUser : Bool
    var bio : String
    var location : String
    var followers : Int
    var following : Int
    var userTweets : Int
    var userCreatedAt : String
    var reTweetCount : Int
    var favouriteCount : Int
    
    init(from json: JSON) {
        
        self.text = json["text"].string ?? ""
        self.name = json["user"]["name"].string ?? ""
        self.screenName = json["user"]["screen_name"].string ?? ""
        self.tweetMediaUrl = json["extended_entities"]["media"][0]["media_url_https"].string ?? ""
        print(" THE COVER URL ::::: ",json["user"]["profile_banner_url_https"].string)
        self.coverImageUrl = json["user"]["profile_banner_url_https"].string ?? ""
        self.profileImageUrl = json["user"]["profile_image_url_https"].string ?? ""
        self.verifiedUser = json["user"]["verified"].bool ?? false
        self.bio = json["user"]["description"].string ?? ""
        self.location = json["user"]["location"].string ?? ""
        self.followers = json["user"]["followers_count"].int ?? 0
        self.following = json["user"]["friends_count"].int ?? 0
        self.userTweets = json["user"]["statuses_count"].int ?? 0
        self.reTweetCount = json["retweet_count"].int ?? 0
        self.favouriteCount = json["favorite_count"].int ?? 0
        
        let tweetDate = Date.parseTwitterDate(twitterDate: (json["created_at"].string ?? ""), joined: false)?.toDate(withFormat: Constants.isoDateFormat)
        self.tweetCreatedAt = Date.timeAgoSinceDate(tweetDate ?? Date(), currentDate: Date(), numericDates: true)
    
        self.userCreatedAt = Date.parseTwitterDate(twitterDate:
            (json["user"]["created_at"].string ?? ""), joined: true) ?? ""
    }
}

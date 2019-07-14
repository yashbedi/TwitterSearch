//
//  Date.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation


extension Date {
    
    static func timeAgoSinceDate(_ date:Date, currentDate:Date, numericDates: Bool) -> String {
        let calendar = Calendar.current
        let now = currentDate
        let earliest = (now as NSDate).earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest, options: NSCalendar.Options())
        
        if (components.year! >= 2) {
            return "\(components.year!)y"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1yr"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!)mon"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1mon"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!)w"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1w"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!)d"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1d"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!)h"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1h"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!)m"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1min"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!)s"
        } else {
            return "Just now"
        }
    }
    
    static func parseTwitterDate(twitterDate:String, joined: Bool)->String?{
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.twitterDateFormat
        
        let indate = formatter.date(from: twitterDate)
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = joined ? Constants.whenJoinedFormat : Constants.isoDateFormat
        var outputDate:String?
        if let d = indate {
            outputDate = outputFormatter.string(from: d)
        }
        return outputDate;
    }
}

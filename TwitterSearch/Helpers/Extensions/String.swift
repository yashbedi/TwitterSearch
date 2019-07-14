//
//  String.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(withFormat format: String = Constants.isoDateFormat)-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Calcutta")
        dateFormatter.locale = Locale(identifier: "en_IN")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}

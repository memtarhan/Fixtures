//
//  Date+.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import Foundation

extension Date {
    var asMatchDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE d/M"
        return dateFormatter.string(from: self)
    }

    var countdown: String? {
        let now = Date()
        let difference = timeIntervalSince1970 - now.timeIntervalSince1970
        let wholeInMinutes: Int = Int(difference / 60)
        let minutes = wholeInMinutes % 60
        let wholeInHours = wholeInMinutes / 60
        let hours = wholeInHours % 24
        let days = wholeInHours / 24
        
        return "\(days)d \(hours)h \(minutes)m"
    }
}

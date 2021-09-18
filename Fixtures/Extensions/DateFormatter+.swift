//
//  DateFormatter+.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import Foundation

extension DateFormatter {
    class var iso8601Full: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
}

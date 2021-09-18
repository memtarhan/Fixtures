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
}

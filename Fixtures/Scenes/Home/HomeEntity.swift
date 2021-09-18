//
//  HomeEntity.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import Foundation

struct HomeEntity {
    struct Init {
        struct ViewModel {
            let date: String
            let period: String
            let homeTeamName: String
            let awayTeamName: String
            let venue: String
            let score: String
            let competition: String
            var notificationOn: Bool
        }
    }
}

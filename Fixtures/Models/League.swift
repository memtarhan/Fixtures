//
//  League.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 19/09/2021.
//

import Foundation

/**
 Created this because I needed an API Key to fetch leagues.
 This will be hardcoded
 */
enum League: Int {
    case championsLeague = 5
    case europaLeague = 6
    case premierLeague = 9

    var id: Int {
        switch self {
        case .championsLeague: return 5
        case .europaLeague: return 6
        case .premierLeague: return 8
        }
    }

    var title: String {
        switch self {
        case .championsLeague: return "Champions League"
        case .europaLeague: return "Europa League"
        case .premierLeague: return "English Premier League"
        }
    }

    static var all: [League] {
        return [.premierLeague, .championsLeague, .europaLeague]
    }
}

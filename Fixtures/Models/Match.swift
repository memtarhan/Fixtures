//
//  Match.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import Foundation

class MatchesResult: Codable {
    let matches: [Match]

    enum CodingKeys: String, CodingKey {
        case matches = "data"
    }
}

class Match: Codable {
    let id: String?
    let feedMatchId: Int?
    let skyId: Int?
    let competition: String?
    let competitionId: Int?
    let status: String?
    let period: String?
    let seasonId: Int?
    let season: String?
    let round: Int?
    let roundType: String?
    let type: String?
    let groupName: String?
    let minute: Int?
    let attendance: Int?
    let date: Date
    let lastUpdated: Date?
    let homeTeam: Team
    let awayTeam: Team
    let venue: Venue?
}

class Team: Codable {
    let id: String?
    let skyId: Int?
    let name: String?
    let shortName: String?
    let abbreviation: String?
    let score: Int?
    let halfTimeScore: Int?
}

class Venue: Codable {
    let id: Int?
    let name: String?
    let location: String?
}

enum MatchStatus: String {
    case result
    case live
    case fixture
}

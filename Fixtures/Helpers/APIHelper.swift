//
//  APIHelper.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import Foundation

class APIHelper {
    static let shared = APIHelper()

    private init() {}

    private var baseURL = "https://feeds.incrowdsports.com/provider/opta/"
    private var version = "v1"

    func retrieveURL(for sports: SportsType, competition: Int, season: Int) -> String {
        let url = "\(baseURL)\(sports.rawValue)/\(version)/matches?compId=\(competition)&season=\(season)"
        return url
    }
}

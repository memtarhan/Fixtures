//
//  HomeInteractor.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

protocol HomeInteractor: AnyObject {
    func retrieveMatches(for sports: SportsType, competition: Int, season: Int, _ completionHandler: @escaping (Result<[Match], Error>) -> Void)
}

class HomeInteractorImpl: HomeInteractor {
    func retrieveMatches(for sports: SportsType, competition: Int, season: Int, _ completionHandler: @escaping (Result<[Match], Error>) -> Void) {
        let urlString = APIHelper.shared.retrieveURL(for: sports, competition: competition, season: season)
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))

            } else {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                let result = try? decoder.decode(MatchesResult.self, from: data!)
                if let matches = result?.matches {
                    completionHandler(.success(matches))
                }
            }
        }.resume()
    }
}



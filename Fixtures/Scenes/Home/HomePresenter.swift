//
//  HomePresenter.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

protocol HomePresenter: AnyObject {
    var view: HomeViewController? { get set }
    var interactor: HomeInteractor? { get set }

    func present()
}

class HomePresenterImpl: HomePresenter {
    weak var view: HomeViewController?
    weak var interactor: HomeInteractor?

    func present() {
        print(#function)
        interactor?.retrieveMatches(for: .football, competition: 3, season: 2020, { result in
            switch result {
            case let .success(matches):
                let viewModels = matches.map { match in
                    HomeEntity.Init.ViewModel(date: match.date.asMatchDate,
                                              period: match.period,
                                              homeTeamName: match.homeTeam.name,
                                              awayTeamName: match.awayTeam.name,
                                              venue: match.venue.name,
                                              score: "\(match.homeTeam.score)-\(match.awayTeam.score)",
                                              competition: match.competition)
                }
                self.view?.display(viewModels)
            case let .failure(error):
                print(error)
            }
        })
    }
}

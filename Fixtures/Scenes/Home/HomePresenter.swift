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

    func presentInit()
    func presentMatches()
    func presentLiveMatches()
    func presentLeagueChanged(_ league: League)
}

class HomePresenterImpl: HomePresenter {
    weak var view: HomeViewController?
    weak var interactor: HomeInteractor?

    private var matches = [Match]()
    private var shouldDisplaLiveMatches = false

    func presentInit() {
        guard let league = interactor?.selectedLeague else { return }
        let viewModel = HomeEntity.Init.ViewModel(title: league.title,
                                                  liveButtonTitle: shouldDisplaLiveMatches ? "Live" : "All")
        view?.display(viewModel)
        presentMatches()
    }

    func presentMatches() {
        guard let league = interactor?.selectedLeague else { return }
        let competitionId = league.id
        interactor?.retrieveMatches(for: .football, competition: competitionId, season: 2021, { result in
            switch result {
            case let .success(matches):
                self.matches = matches
                let sorted = matches.sorted(by: { $0.date < $1.date }) /// - Sorted in  chronological order
                self.display(matches: sorted)
            case let .failure(error):
                print(error)
            }
        })
    }

    func presentLiveMatches() {
        shouldDisplaLiveMatches = !shouldDisplaLiveMatches

        if shouldDisplaLiveMatches {
            let liveMatches = matches.filter({ $0.status == MatchStatus.live.rawValue })
            display(matches: liveMatches)

        } else {
            display(matches: matches)
        }

        guard let league = interactor?.selectedLeague else { return }
        let viewModel = HomeEntity.Init.ViewModel(title: league.title,
                                                  liveButtonTitle: shouldDisplaLiveMatches ? "Live" : "All")
        view?.display(viewModel)
    }

    func presentLeagueChanged(_ league: League) {
        interactor?.selectedLeague = league
        presentInit()
    }

    private func display(matches: [Match]) {
        let viewModels = matches.map { match -> HomeEntity.Match.ViewModel in
            let status = MatchStatus(rawValue: match.status ?? "fixture")
            let countdown = status == .fixture ? match.date.countdown: nil
            return HomeEntity.Match.ViewModel(date: match.date.asMatchDate,
                                              period: match.period,
                                              homeTeamName: match.homeTeam.abbreviation,
                                              awayTeamName: match.awayTeam.abbreviation,
                                              venue: match.venue?.name,
                                              score: "\(match.homeTeam.score ?? 0)-\(match.awayTeam.score ?? 0)",
                                              competition: match.competition,
                                              notificationOn: false,
                                              matchCenterAvailable: match.status == MatchStatus.result.rawValue,
                                              countdown: countdown)
        }
        view?.display(viewModels)
    }
}

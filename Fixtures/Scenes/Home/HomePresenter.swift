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
                print(matches)
            case let .failure(error):
                print(error)
            }
        })
    }
}

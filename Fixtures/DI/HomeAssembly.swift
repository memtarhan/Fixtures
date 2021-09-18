//
//  HomeAssembly.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

class HomeAssembly {
    static let shared = HomeAssembly()

    var view: HomeViewController?
    var presenter: HomePresenter?
    var interactor: HomeInteractor?

    private init() {
        assemble()
    }

    private func assemble() {
        view = HomeViewControllerImpl(nibName: "HomeViewController", bundle: nil)
        presenter = HomePresenterImpl()
        interactor = HomeInteractorImpl()

        view?.presenter = presenter
        presenter?.view = view
        presenter?.interactor = interactor
    }
}

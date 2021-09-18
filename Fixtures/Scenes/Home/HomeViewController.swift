//
//  HomeViewController.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

protocol HomeViewController: AnyObject {
    var presenter: HomePresenter? { get set }
}

class HomeViewControllerImpl: UIViewController {
    weak var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        title = "Fixtures"
        
        presenter?.present()
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
}

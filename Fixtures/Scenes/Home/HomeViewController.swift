//
//  HomeViewController.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

protocol HomeViewController: AnyObject {
    var presenter: HomePresenter? { get set }

    func display(_ viewModels: [HomeEntity.Init.ViewModel])
}

class HomeViewControllerImpl: UIViewController {
    weak var presenter: HomePresenter?

    // MARK: - Outlets

    @IBOutlet var tableView: UITableView!

    // MARK: - Properties

    private let cellNibIdentifier = "MatchTableViewCell"
    private let cellReuseIdentifier = "Match"
    private let cellRowHeight: CGFloat = 240

    private var viewModels = [HomeEntity.Init.ViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        title = "Fixtures"

        let cellNib = UINib(nibName: cellNibIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)

        tableView.dataSource = self
        tableView.rowHeight = cellRowHeight
        tableView.estimatedRowHeight = cellRowHeight

        presenter?.present()
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
    func display(_ viewModels: [HomeEntity.Init.ViewModel]) {
        self.viewModels = viewModels
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewControllerImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MatchTableViewCell else { return UITableViewCell() }

        let viewModel = viewModels[indexPath.row]
        cell.configure(viewModel)
        return cell
    }
}

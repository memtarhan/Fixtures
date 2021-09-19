//
//  HomeViewController.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

protocol HomeViewController: AnyObject {
    var presenter: HomePresenter? { get set }

    func display(_ viewModel: HomeEntity.Init.ViewModel)
    func display(_ viewModels: [HomeEntity.Match.ViewModel])
}

class HomeViewControllerImpl: UIViewController {
    weak var presenter: HomePresenter?

    // MARK: - Outlets

    @IBOutlet var tableView: UITableView!

    // MARK: - Properties

    private let cellNibIdentifier = "MatchTableViewCell"
    private let cellReuseIdentifier = "Match"
    private let cellRowHeight: CGFloat = 300

    private var viewModels = [HomeEntity.Match.ViewModel]()

    private var leftBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Actions

    @objc private func didTapLeague(_ sender: UIBarButtonItem) {
        displayLeagues()
    }

    // MARK: - Actions

    @objc private func didTapLive(_ sender: UIBarButtonItem) {
        displayLiveMatches()
    }

    private func setup() {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left.arrow.right"), style: .done, target: self, action: #selector(didTapLeague(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem

        leftBarButtonItem = UIBarButtonItem(title: "Live", style: .plain, target: self, action: #selector(didTapLive(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem

        let cellNib = UINib(nibName: cellNibIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)

        tableView.dataSource = self
        tableView.rowHeight = cellRowHeight
        tableView.estimatedRowHeight = cellRowHeight
        tableView.isHidden = true

        presenter?.presentInit()
    }

    private func displayLeagues() {
        let actionSheet = UIAlertController(title: "Choose a league", message: nil, preferredStyle: .actionSheet)
        League.all.forEach { league in
            let action = UIAlertAction(title: league.title, style: .default) { _ in
                self.tableView.isHidden = true
                self.presenter?.presentLeagueChanged(league)
            }
            actionSheet.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true, completion: nil)
    }

    private func displayLiveMatches() {
        tableView.isHidden = true
        presenter?.presentLiveMatches()
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
    func display(_ viewModel: HomeEntity.Init.ViewModel) {
        DispatchQueue.main.async {
            self.title = viewModel.title
            self.leftBarButtonItem.title = viewModel.liveButtonTitle
        }
    }

    func display(_ viewModels: [HomeEntity.Match.ViewModel]) {
        self.viewModels = viewModels
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewControllerImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModels.isEmpty { tableView.setEmptyMessage("No live matches at the moment") }
        else { tableView.restore() }
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MatchTableViewCell else { return UITableViewCell() }

        let viewModel = viewModels[indexPath.row]
        cell.configure(viewModel)
        return cell
    }
}

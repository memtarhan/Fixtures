//
//  MatchTableViewCell.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var periodLabel: UILabel!
    @IBOutlet var homeTeamNameLabel: UILabel!
    @IBOutlet var awayTeamNameLabel: UILabel!
    @IBOutlet var venueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var competitionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(_ viewModel: HomeEntity.Init.ViewModel) {
        dateLabel.text = viewModel.date
        periodLabel.text = viewModel.period
        homeTeamNameLabel.text = viewModel.homeTeamName
        awayTeamNameLabel.text = viewModel.awayTeamName
        venueLabel.text = viewModel.venue
        scoreLabel.text = viewModel.score
        competitionLabel.text = viewModel.competition
    }
}

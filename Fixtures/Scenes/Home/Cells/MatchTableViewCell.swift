//
//  MatchTableViewCell.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet var containerView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var periodLabel: UILabel!
    @IBOutlet var homeTeamNameLabel: UILabel!
    @IBOutlet var awayTeamNameLabel: UILabel!
    @IBOutlet var venueLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var competitionLabel: UILabel!
    @IBOutlet var notificationButton: UIButton!
    @IBOutlet var matchCentreButton: UIButton!

    private var viewModel: HomeEntity.Match.ViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()

        containerView.roundCorners()
        matchCentreButton.roundCorners(matchCentreButton.frame.height / 2)
    }

    override func prepareForReuse() {
        notificationButton.setImage(UIImage(named: "notificationOff"), for: [])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func didTapNotification(_ sender: UIButton) {
        viewModel.notificationOn = !viewModel.notificationOn
        let image: UIImage? = viewModel.notificationOn ? UIImage(named: "notificationOn") : UIImage(named: "notificationOff")
        sender.setImage(image, for: [])
    }

    func configure(_ viewModel: HomeEntity.Match.ViewModel) {
        self.viewModel = viewModel

        dateLabel.text = viewModel.date
        periodLabel.text = viewModel.period
        homeTeamNameLabel.text = viewModel.homeTeamName
        awayTeamNameLabel.text = viewModel.awayTeamName
        venueLabel.text = viewModel.venue
        scoreLabel.text = viewModel.score
        competitionLabel.text = viewModel.competition

        if viewModel.matchCenterAvailable {
            matchCentreButton.enable()

        } else {
            matchCentreButton.disable()
        }
    }
}

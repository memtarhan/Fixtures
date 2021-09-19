//
//  UITableView+.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 19/09/2021.
//

import UIKit

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 14, weight: .bold)
        messageLabel.sizeToFit()

        backgroundView = messageLabel
        separatorStyle = .none
    }

    func restore() {
        backgroundView = nil
        separatorStyle = .singleLine
    }
}

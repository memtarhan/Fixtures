//
//  CircleImageView.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 18/09/2021.
//

import UIKit

class CircleImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = frame.height / 2
    }
}

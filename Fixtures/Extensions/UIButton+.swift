//
//  UIButton+.swift
//  Fixtures
//
//  Created by Mehmet Tarhan on 19/09/2021.
//

import UIKit

extension UIButton {
    func enable() {
        backgroundColor = .accent
        setTitleColor(.white, for: [])
        isEnabled = true
    }

    func disable() {
        backgroundColor = .tertiarySystemGroupedBackground
        setTitleColor(.label, for: [])
        isEnabled = false
    }
}

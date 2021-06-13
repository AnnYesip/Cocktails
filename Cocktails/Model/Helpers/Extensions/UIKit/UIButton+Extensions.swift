//
//  UIButton+Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.06.2021.
//

import UIKit

extension UIButton {
  static func createDefaultButton() -> UIButton {
    let button = UIButton(type: UIButton.ButtonType.system)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
}

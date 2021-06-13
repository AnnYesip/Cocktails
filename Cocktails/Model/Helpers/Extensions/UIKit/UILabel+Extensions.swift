//
//  UILabel+Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.06.2021.
//

import UIKit

extension UILabel {
  static func createDefaultLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
}

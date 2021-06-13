//
//  UIImageView+Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.06.2021.
//

import UIKit

extension UIImageView {
  static func createDefaultImageView() -> UIImageView {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }
}

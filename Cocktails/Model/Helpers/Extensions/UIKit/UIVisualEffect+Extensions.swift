//
//  UIVisualEffect+Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.06.2021.
//

import UIKit

extension UIVisualEffectView {
  static func createDefaultVisualEffectView() -> UIVisualEffectView {
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    blurView.translatesAutoresizingMaskIntoConstraints = false
    return blurView
  }
}

//
//  Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 12.06.2021.
//

import UIKit

extension UIScrollView {
  static func createDefaultScrollView() -> UIScrollView {
    let scroll = UIScrollView()
    scroll.translatesAutoresizingMaskIntoConstraints = false
    return scroll
  }
}

extension UIView {
  static func createDefaultView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
}

extension UILabel {
  static func createDefaultLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
}

extension UIImageView {
  static func createDefaultImageView() -> UIImageView {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }
}

extension UIButton {
  static func createDefaultButton() -> UIButton {
    let button = UIButton(type: UIButton.ButtonType.system)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
}

extension UITextView {
  static func createDefaultTextView() -> UITextView {
    let textField = UITextView()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.isEditable = false
    return textField
  }
}

extension UIVisualEffectView {
  static func createDefaultVisualEffectView() -> UIVisualEffectView {
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    blurView.translatesAutoresizingMaskIntoConstraints = false
    return blurView
  }
}

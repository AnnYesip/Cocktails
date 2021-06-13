//
//  UITextView+Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.06.2021.
//

import UIKit

extension UITextView {
  static func createDefaultTextView() -> UITextView {
    let textField = UITextView()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.isEditable = false
    return textField
  }
}

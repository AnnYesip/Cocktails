//
//  UIVIew+Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.06.2021.
//

import UIKit

extension UIView {
  static func createDefaultView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
}

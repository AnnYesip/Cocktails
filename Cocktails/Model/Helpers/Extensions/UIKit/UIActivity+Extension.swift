//
//  UIActivity+Extension.swift
//  Cocktails
//
//  Created by Ann Yesip on 05.07.2021.
//

import UIKit

extension UIActivityIndicatorView{
  static func createDefaultActivity() -> UIActivityIndicatorView {
    let activity = UIActivityIndicatorView()
    activity.translatesAutoresizingMaskIntoConstraints = false
    return activity
  }
}

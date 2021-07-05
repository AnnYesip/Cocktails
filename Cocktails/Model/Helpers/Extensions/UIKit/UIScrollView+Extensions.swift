//
//  UIScrollView+Extensions.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.06.2021.
//

import UIKit

extension UIScrollView {
  static func createDefaultScrollView() -> UIScrollView {
    let scroll = UIScrollView()
    scroll.translatesAutoresizingMaskIntoConstraints = false
    scroll.isOpaque = false
    return scroll
  }
}

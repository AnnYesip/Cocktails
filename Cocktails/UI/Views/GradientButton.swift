//
//  GradientButton.swift
//  Cocktails
//
//  Created by Ann Yesip on 12.06.2021.
//

import UIKit

final class ActualGradientButton: UIButton {
  override func layoutSubviews() {
    super.layoutSubviews()
    setGradient()
  }

  private func setGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [UIColor.systemYellow.cgColor, UIColor.systemPink.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    gradientLayer.cornerRadius = 16
    guard
      let sublayers = layer.sublayers,
      !sublayers.contains(gradientLayer) else { return }
    layer.insertSublayer(gradientLayer, at: 0)
  }
}

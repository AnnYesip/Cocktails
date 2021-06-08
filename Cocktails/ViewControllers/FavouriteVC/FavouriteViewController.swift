//
//  SecondViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 03.06.2021.
//

import UIKit

class FavouriteViewController: UIViewController {
  let label = UILabel.createDefaultLabel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemRed
      view.addSubview(label)
      setupLabel()
    }
  
  func setupLabel(){
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
    label.text = "Your favourite cocktails"
    label.font = .boldSystemFont(ofSize: 25)
  }
  
}

//
//  DetailViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 29.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
  var id = String()
  
  let cocktailName = UILabel.createDefaultLabel()
  let cocktailImage = UIImageView.createDefaultImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    view.addSubview(cocktailName)
    view.addSubview(cocktailImage)
    print(id)
    
    setupCocktailsName()
    setupCcocktailImage()
  }
  
  func setupCocktailsName(){
    NSLayoutConstraint.activate([
      cocktailName.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
      cocktailName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
    cocktailName.text = " Fine Cocktail"
    cocktailName.font = .boldSystemFont(ofSize: 20)
  }
  
  func setupCcocktailImage(){
    NSLayoutConstraint.activate([
      cocktailImage.topAnchor.constraint(equalTo: cocktailName.bottomAnchor, constant: 15),
      cocktailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cocktailImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
      cocktailImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])
    
    cocktailImage.layer.cornerRadius = 10
    cocktailImage.backgroundColor = .black
  }
  
  
  
}

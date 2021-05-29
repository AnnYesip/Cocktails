//
//  CollectionViewCell.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//

import UIKit


class FirstCollectionViewCell: UICollectionViewCell{
  
  class var reuseIdentifier: String {
    return "Identifier"
  }
  //MARK: UIElements -
  let cocktailImage = UIImageView.createDefaultImageView()
  var cocktailsLabel = UILabel.createDefaultLabel()
  let blurView = UIVisualEffectView.createDefaultVisualEffectView()
  
  //MARK: UIMethods -
  func setupCoctailImage(){
    NSLayoutConstraint.activate([
      cocktailImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      cocktailImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      cocktailImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      cocktailImage.heightAnchor.constraint(equalTo: contentView.heightAnchor)
    ])
    cocktailImage.layer.cornerRadius = 10
  }
  
  func setupBlur(){
    NSLayoutConstraint.activate([
      blurView.bottomAnchor.constraint(equalTo: cocktailsLabel.bottomAnchor),
      blurView.leadingAnchor.constraint(equalTo: cocktailImage.leadingAnchor),
      blurView.heightAnchor.constraint(equalTo: cocktailsLabel.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: cocktailImage.widthAnchor)
    ])
  }
  
  func setupCocktailLabel(){
    NSLayoutConstraint.activate([
      cocktailsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      cocktailsLabel.bottomAnchor.constraint(equalTo: cocktailImage.bottomAnchor),
      cocktailsLabel.widthAnchor.constraint(equalTo: cocktailImage.widthAnchor),
      cocktailsLabel.heightAnchor.constraint(equalTo: cocktailImage.heightAnchor, multiplier: 0.2)
    ])
    cocktailsLabel.numberOfLines = 0
    cocktailsLabel.font = UIFont.boldSystemFont(ofSize: 16)
    cocktailsLabel.textAlignment = .center
    cocktailsLabel.sendSubviewToBack(blurView)
  }
  
  //MARK: Initializer -
  override init(frame: CGRect) {
    super.init(frame: .zero)
    contentView.addSubview(cocktailImage)
    cocktailImage.addSubview(blurView)
    cocktailImage.addSubview(cocktailsLabel)
    setupCoctailImage()
    setupCocktailLabel()
    setupBlur()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  deinit {
    print("first collection view was deinin")
  }
  
}

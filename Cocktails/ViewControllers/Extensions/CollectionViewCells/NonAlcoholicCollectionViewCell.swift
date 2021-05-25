//
//  NonAlcoholicCollectionViewCell.swift
//  Cocktails
//
//  Created by Ann Yesip on 13.04.2021.
//

import UIKit

class NonAlcoholicCollectionViewCell: UICollectionViewCell{
    
    class var reuseIdentifier: String {
        return "IdentifierCell"
    }
  //MARK: UIElements -
  let cocktailImage = UIImageView.createDefaultImageView()
  var cocktailsLabel = UILabel.createDefaultLabel()
  
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
  
  func setupCocktailLabel(){
    NSLayoutConstraint.activate([
      cocktailsLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
      cocktailsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
    ])
    cocktailsLabel.numberOfLines = 0
    cocktailsLabel.backgroundColor = .init(white: 1, alpha: 0.8)
    cocktailsLabel.layer.cornerRadius = 10
  }
    
    //MARK: Initializer -
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(cocktailImage)
        cocktailImage.addSubview(cocktailsLabel)
        setupCoctailImage()
        setupCocktailLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deallocating \(self)")
    }
}

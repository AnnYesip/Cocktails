//
//  SearchTableViewCell.swift
//  Cocktails
//
//  Created by Ann Yesip on 25.05.2021.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
  
  class var reuseIdentifier: String {
    return "Identifier2"
  }
  
  //MARK: UIElements -
  let cocktailsLabel = UILabel.createDefaultLabel()
  let cocktailsAlcoholLabel = UILabel.createDefaultLabel()
  let cocktailImage = UIImageView.createDefaultImageView()
  
  //MARK: UIMethods -
  func setupCocktailLabel() {
    NSLayoutConstraint.activate([
      cocktailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      cocktailsLabel.leftAnchor.constraint(equalTo: cocktailImage.rightAnchor, constant: 15),
      cocktailsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
    ])
    cocktailsLabel.numberOfLines = 0
    cocktailsLabel.font = UIFont.boldSystemFont(ofSize: 20)
  }
  
  func setupCocktailsAlcoholLabel() {
    NSLayoutConstraint.activate([
      cocktailsAlcoholLabel.topAnchor.constraint(equalTo: cocktailsLabel.bottomAnchor, constant: 15),
      cocktailsAlcoholLabel.leftAnchor.constraint(equalTo: cocktailImage.rightAnchor, constant: 15)
    ])
    cocktailsAlcoholLabel.numberOfLines = 0
    cocktailsAlcoholLabel.textColor = .systemGray
    cocktailsAlcoholLabel.text = "Alcoholic maybe"
    cocktailsAlcoholLabel.font = UIFont.systemFont(ofSize: 20)
  }

  func setupCocktailImage() {
    NSLayoutConstraint.activate([
      cocktailImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
      cocktailImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      cocktailImage.widthAnchor.constraint(equalToConstant: 150),
      cocktailImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
    ])
    cocktailImage.sizeToFit()
    cocktailImage.layer.masksToBounds = true
    cocktailImage.layer.cornerRadius = 10
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(cocktailsLabel)
    contentView.addSubview(cocktailImage)
    contentView.addSubview(cocktailsAlcoholLabel)
    setupCocktailLabel()
    setupCocktailsAlcoholLabel()
    setupCocktailImage()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

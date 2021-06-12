//
//  FavouriteTableViewCell.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.06.2021.
//

import UIKit

final class FavouriteTableViewCell: UITableViewCell {
  static var reuseIdentifier: String {
    return "IdentifierFavouriteCocktails"
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  //MARK: UIElements -
  let cocktailImage = UIImageView.createDefaultImageView()
  let cocktailsLabel = UILabel.createDefaultLabel()
  
  //MARK: UIMethods -
  private func setupCoctailImage() {
    NSLayoutConstraint.activate([
      cocktailImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
      cocktailImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -220),
      cocktailImage.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant: -20),
      cocktailImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      cocktailImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
    ])
    cocktailImage.layer.cornerRadius = 10
    cocktailImage.backgroundColor = .black
  }
  
  private func setupCocktailLabel() {
    NSLayoutConstraint.activate([
      cocktailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
      cocktailsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant:  90),
      cocktailsLabel.widthAnchor.constraint(equalToConstant: 150)
    ])
    cocktailsLabel.numberOfLines = 0
    cocktailsLabel.font = UIFont.boldSystemFont(ofSize: 20)
  }
  
  //MARK: Initializer -
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(cocktailImage)
    contentView.addSubview(cocktailsLabel)
    setupCoctailImage()
    setupCocktailLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}

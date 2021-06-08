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

  //MARK: UIMethods -

  func setupCocktailLabel(){
    NSLayoutConstraint.activate([
      cocktailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      cocktailsLabel.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5)

    ])
    cocktailsLabel.numberOfLines = 0
    cocktailsLabel.font = UIFont.boldSystemFont(ofSize: 20)
  }
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      contentView.addSubview(cocktailsLabel)
      setupCocktailLabel()

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

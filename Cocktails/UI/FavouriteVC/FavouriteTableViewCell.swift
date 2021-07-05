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
  
  //MARK: Initializer -
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

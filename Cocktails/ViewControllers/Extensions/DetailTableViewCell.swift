//
//  DetailTableViewCell.swift
//  Cocktails
//
//  Created by Ann Yesip on 30.05.2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
  
  class var reuseIdentifier: String {
      return "IdentifierDetail"
  }
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class DetailTableViewCell2: UITableViewCell {
  
  class var reuseIdentifier: String {
      return "IdentifierDetail2"
  }
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  FavouriteTableView + TableView.swift
//  Cocktails
//
//  Created by Ann Yesip on 12.06.2021.
//

import UIKit

// MARK: - Table view data source
extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(
      withIdentifier: FavouriteTableViewCell.reuseIdentifier,
      for: indexPath
    ) as! FavouriteTableViewCell
    cell.cocktailsLabel.text = "cocktails"
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let secondVC = DetailViewController()
    navigationController?.present(secondVC, animated: true)
  }
}

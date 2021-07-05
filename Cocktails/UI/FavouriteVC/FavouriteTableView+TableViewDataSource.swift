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
    return coreDataManager.fetchFavouriteCocktails().count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(
      withIdentifier: FavouriteTableViewCell.reuseIdentifier,
      for: indexPath
    ) as! FavouriteTableViewCell
    guard coreDataManager.fetchFavouriteCocktails().count - 1 >= indexPath.row else { return UITableViewCell() }
    cell.setSelected(true, animated: true)
    cell.selectionStyle = .none
    let cocktail = coreDataManager.fetchFavouriteCocktails()[indexPath.row]
    cell.textLabel?.text = cocktail.name
    let imageData = cocktail.image
    cell.imageView?.image = UIImage(data: imageData!)
    cell.imageView?.layer.masksToBounds = true
    cell.imageView?.layer.cornerRadius = 10
    cell.textLabel?.font = .boldSystemFont(ofSize: 20)
    cell.detailTextLabel?.text = "click to see more"
    cell.detailTextLabel?.font = .systemFont(ofSize: 15)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cocktail = coreDataManager.fetchFavouriteCocktails()[indexPath.row]
    let secondVC = DetailViewController()
    tableView.cellForRow(at: indexPath)?.selectionStyle = .none
    guard let cocktailId = cocktail.id else { return }
    print(cocktailId)
    secondVC.id = cocktailId
    tabBarController?.present(secondVC, animated: true)
  }
  
}

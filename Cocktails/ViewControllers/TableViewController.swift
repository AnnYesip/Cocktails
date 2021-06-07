//
//  TableViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 19.05.2021.
//

import UIKit

class TableViewController: UITableViewController {
  let coreDataManager = CoreDataManager()
  let networkManager = NetworkManager()
  var tableId: Int = 0
  let downloadData = Download()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView.tag == 1{
      return coreDataManager.fetchCocktails().count
    } else if tableView.tag == 2 {
      return coreDataManager.fetchNonAlcoholicCocktails().count
    }
    return Int()
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView.tag == 1{
      print("tag 1")
      tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
      let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
      let cocktail = coreDataManager.fetchCocktails()[indexPath.row]
      cell.cocktailImage.image = UIImage(data: cocktail.image!)
      cell.cocktailImage.clipsToBounds = true
      cell.cocktailsLabel.text = cocktail.name
      cell.cocktailText.text = cocktail.strInstructions
      return cell
    } else if tableView.tag == 2 {
      print("tag 2")
      tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: SecondTableViewCell.reuseIdentifier)
      let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.reuseIdentifier, for: indexPath) as! SecondTableViewCell
      let cocktail = coreDataManager.fetchNonAlcoholicCocktails()[indexPath.row]
      cell.cocktailImage.image = UIImage(data: cocktail.image!)
      cell.cocktailImage.clipsToBounds = true
      cell.cocktailsLabel.text = cocktail.name
      return cell
    }
    return UITableViewCell()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let secondVC = DetailViewController()
    if tableView.tag == 1{
      let cocktail = coreDataManager.fetchCocktails()[indexPath.row]
      secondVC.id = cocktail.id ?? "1"
    } else {
      let cocktail = coreDataManager.fetchNonAlcoholicCocktails()[indexPath.row]
      secondVC.id = cocktail.id ?? "1"
    }
    navigationController?.present(secondVC, animated: true)
  }
  
}

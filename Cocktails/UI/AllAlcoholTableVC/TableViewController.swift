//
//  TableViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 19.05.2021.
//

import UIKit

final class TableViewController: UITableViewController {
  let coreDataManager = CoreDataManager()
  let networkManager = NetworkManager()
  let cocktailDataManager = CocktailDataManager()
  var tableId: Int = 0
  
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
    if tableView.tag == 1 {
      tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
      let cell = self.tableView.dequeueReusableCell(
        withIdentifier: TableViewCell.reuseIdentifier,
        for: indexPath
      ) as! TableViewCell
      guard coreDataManager.fetchCocktails().count >= indexPath.row else { return UITableViewCell() }
      let cocktail = coreDataManager.fetchCocktails()[indexPath.row]
      cell.cocktailImage.image = UIImage(data: cocktail.image!)
      cell.cocktailImage.clipsToBounds = true
      cell.cocktailsLabel.text = cocktail.name
      return cell
      
    } else if tableView.tag == 2 {
      tableView.register(
        AllAlcoholSecondTableViewCell.self,
        forCellReuseIdentifier: AllAlcoholSecondTableViewCell.reuseIdentifier
      )
      let cell = tableView.dequeueReusableCell(
        withIdentifier: AllAlcoholSecondTableViewCell.reuseIdentifier,
        for: indexPath
      ) as! AllAlcoholSecondTableViewCell
      guard coreDataManager.fetchNonAlcoholicCocktails().count >= indexPath.row else { return UITableViewCell() }
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
      guard coreDataManager.fetchCocktails().count >= indexPath.row else { return }
      let cocktail = coreDataManager.fetchCocktails()[indexPath.row]
      secondVC.id = cocktail.id ?? "1"
    } else {
      guard coreDataManager.fetchNonAlcoholicCocktails().count >= indexPath.row else { return }
      let cocktail = coreDataManager.fetchNonAlcoholicCocktails()[indexPath.row]
      secondVC.id = cocktail.id ?? "1"
    }
    navigationController?.present(secondVC, animated: true)
  }
  
  deinit {
    print("Deallocating \(self)")
  }
}

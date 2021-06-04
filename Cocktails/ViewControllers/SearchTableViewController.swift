//
//  SearchTableViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 25.05.2021.
//

import UIKit


class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate {
  
  var cocktailArray: [String] = []
  var cocktailId: [String] = []
  var searchController = UISearchController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    navigationItem.searchController = searchController
    searchController.searchResultsUpdater = self
    searchController.delegate = self
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Search"
  }
  

  
  
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    cocktailId.removeAll()
    cocktailArray.removeAll()
    tableView.reloadData()
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    cocktailId.removeAll()
    cocktailArray.removeAll()
    tableView.reloadData()
  }
  
  func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
    cocktailId.removeAll()
    cocktailArray.removeAll()
    tableView.reloadData()
  }
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    cocktailId.removeAll()
    cocktailArray.removeAll()
    tableView.reloadData()
  }

  
  
  func updateSearchResults(for searchController: UISearchController) {
    
    let queue = DispatchQueue(label: "download_queue", qos: .utility)
    guard let text = searchController.searchBar.text else { return }
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(text)"
    guard let url = URL(string: urlString) else { return }
    let session = URLSession.shared
    queue.async {
      session.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
          let json = try JSONDecoder().decode(Cocktails.self, from: data)

          json.drinks.forEach { data in
            let dataStr = data.strDrink
            let dataId = data.idDrink
            DispatchQueue.main.async {
              self.cocktailId.insert(dataId, at: 0)
              self.cocktailArray.insert(dataStr, at: 0)
              self.tableView.reloadData()
            }

          }
        }catch let error as NSError {
          print(error)
        }
      }.resume()
    }

  }
  
  
  
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cocktailArray.count
  }
  
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
    cell.textLabel?.text = cocktailArray[indexPath.row]

   
   return cell
   }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 80
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let secondVC = DetailViewController()
    
      let cocktail = cocktailId[indexPath.row]
      secondVC.id = cocktail

    
    navigationController?.present(secondVC, animated: true)
  }
}

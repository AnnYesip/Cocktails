//
//  SearchTableViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 25.05.2021.
//

import UIKit


class SearchTableViewController:
  UITableViewController,
  UISearchBarDelegate,
  UISearchResultsUpdating,
  UISearchControllerDelegate
{
  var cocktailArray: [String] = []
  var cocktailId: [String] = []
  var searchController = UISearchController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.register(
      SearchTableViewCell.self,
      forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier
    )
    navigationItem.searchController = searchController
    searchController.searchResultsUpdater = self
    searchController.delegate = self
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Search"
    searchController.automaticallyShowsCancelButton = true
    searchController.automaticallyShowsSearchResultsController = true
    searchController.searchBar.isSearchResultsButtonSelected = true
    searchController.searchBar.delegate = self
  }
  
  
  func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    cocktailId.removeAll()
    cocktailArray.removeAll()
    tableView.reloadData()
    print("searchBarShouldBeginEditing")
    return true
  }
  
  func updateSearchResults(for searchController: UISearchController) {
    let queue = DispatchQueue(label: "downloadQueue", qos: .utility)
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
              self.cocktailId.append(dataId)
              self.cocktailArray.append(dataStr)
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
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cocktailArray.count
  }
  
  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cell = self.tableView.dequeueReusableCell(
            withIdentifier: SearchTableViewCell.reuseIdentifier,
            for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
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
  
  //MARK: deinit -
  deinit {
    print("deallocating \(self)")
  }
}

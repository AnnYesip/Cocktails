//
//  SearchTableViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 25.05.2021.
//

import UIKit

//MARK:- Extensions
final class SearchTableViewController:
  UITableViewController,
  UISearchBarDelegate,
  UISearchResultsUpdating,
  UISearchControllerDelegate
{
  //MARK: UIElements -
  var cocktailArray: [String] = []
  var cocktailId: [String] = []
  var cocktailAlcoOrNo: [String] = []
  var cocktailImage: [Data] = []
  var searchController = UISearchController()
  
  // MARK: - viewDidLoad
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
  // MARK: - searchBarShouldBeginEditing
  func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    cocktailId.removeAll()
    cocktailImage.removeAll()
    cocktailArray.removeAll()
    tableView.reloadData()
    return true
  }
  // MARK: - searchBarTextDidEndEditing
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    let queue = DispatchQueue(label: "downloadQueue", qos: .utility)
    guard let text = searchController.searchBar.text else { return }
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(text)"
    guard let url = URL(string: urlString) else { return }
    let session = URLSession.shared
    queue.sync {
      session.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
          let json = try JSONDecoder().decode(CocktailsDTO.self, from: data)
          json.drinks.forEach { data in
            guard let imageUrl = URL(string: data.strDrinkThumb) else { return }
            guard let dataImage = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
              self.cocktailImage.append(dataImage)
              self.cocktailAlcoOrNo.append(data.strAlcoholic ?? " ")
              self.cocktailId.append(data.idDrink)
              self.cocktailArray.append(data.strDrink)
              self.tableView.reloadData()
            }
          }
        } catch let error as NSError {
          print(error)
        }
      }.resume()
    }
  }
  
  // MARK: - updateSearchResults
  func updateSearchResults(for searchController: UISearchController) {
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
    cell.cocktailsLabel.text = cocktailArray[indexPath.row]
    cell.cocktailImage.image = UIImage(data: cocktailImage[indexPath.row])
    cell.cocktailsAlcoholLabel.text = cocktailAlcoOrNo[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
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

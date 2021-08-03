//
//  DetailViewController + TableViewDataSourse.swift
//  Cocktails
//
//  Created by Ann Yesip on 30.05.2021.
//

import UIKit

extension DetailViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return ingredients.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    headerTitles[section]
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      tableView.register(DetailTableViewCellWithIngredients.self, forCellReuseIdentifier: "IdentifierDetail")
      let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierDetail", for: indexPath)
      guard ingredients.count  - 1 >= indexPath.row else { return UITableViewCell() }
      cell.textLabel?.text = ingredients[indexPath.row]
      return cell
      
    } else if indexPath.section == 1  {
      tableView.register(DetailTableViewCellWithMeasure.self, forCellReuseIdentifier: "IdentifierDetail")
      let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierDetail", for: indexPath)
      guard measure.count - 1 >= indexPath.row else { return UITableViewCell() }
      cell.textLabel!.text = measure[indexPath.row]
      return cell
    }
    return UITableViewCell()
  }
}

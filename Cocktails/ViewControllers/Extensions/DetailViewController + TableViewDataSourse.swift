//
//  DetailViewController + TableViewDataSourse.swift
//  Cocktails
//
//  Created by Ann Yesip on 30.05.2021.
//

import UIKit

extension DetailViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ingredients.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierDetail", for: indexPath)
    cell.textLabel?.text = ingredients[indexPath.row]
    return cell
  }
  
}

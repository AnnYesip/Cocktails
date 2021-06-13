//
//  SecondViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 03.06.2021.
//

import UIKit

final class FavouriteViewController: UIViewController {
  let coreDataManager = CoreDataManager()
  
  let label = UILabel.createDefaultLabel()
  let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.register(FavouriteTableViewCell.self, forCellReuseIdentifier: FavouriteTableViewCell.reuseIdentifier)
    return table
  }()
  
  //MARK:- Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(label)
    view.addSubview(tableView)
    setupLabel()
    setupTableView()
  }
  
  private func setupLabel(){
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 40),
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    label.text = "Your favourite cocktails"
    label.font = .boldSystemFont(ofSize: 25)
  }
  
  private func setupTableView(){
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
      tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

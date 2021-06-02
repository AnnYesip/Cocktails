//
//  SetupDetailVCUIElements.swift
//  Cocktails
//
//  Created by Ann Yesip on 30.05.2021.
//

import UIKit
import Foundation

extension DetailViewController{
  
  func setupCocktailsName(){
    NSLayoutConstraint.activate([
      cocktailName.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
      cocktailName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
    cocktailName.font = .boldSystemFont(ofSize: 20)
  }
  
  func setupCocktailImage(){
    NSLayoutConstraint.activate([
      cocktailImage.topAnchor.constraint(equalTo: cocktailName.bottomAnchor, constant: 15),
      cocktailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cocktailImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
      cocktailImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])
    cocktailImage.layer.masksToBounds = true
    cocktailImage.layer.cornerRadius = 10
  }
  
  func setupCategoryLabel(){
    NSLayoutConstraint.activate([
      categoryLabel.topAnchor.constraint(equalTo: cocktailImage.bottomAnchor, constant: 5),
      categoryLabel.rightAnchor.constraint(equalTo: cocktailImage.rightAnchor),
      categoryLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])
    categoryLabel.textColor = .systemGray
  }
  
  
  func setupCocktailInstruction(){
    NSLayoutConstraint.activate([
      cocktailInstruction.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
      cocktailInstruction.rightAnchor.constraint(equalTo: categoryLabel.rightAnchor),
      cocktailInstruction.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
    ])
    cocktailInstruction.sizeToFit()
    cocktailInstruction.isScrollEnabled = false
    cocktailInstruction.font = UIFont.systemFont(ofSize: 15)
  }
  
  func setupIngredientsLabel(){
    NSLayoutConstraint.activate([
      ingredientsLabel.topAnchor.constraint(equalTo: cocktailInstruction.bottomAnchor, constant: 15),
      ingredientsLabel.rightAnchor.constraint(equalTo: cocktailInstruction.rightAnchor),
      ingredientsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
    ])
    ingredientsLabel.font = .boldSystemFont(ofSize: 20)
    ingredientsLabel.text = "Ingredients"
  }
  
  //MARK: setup TableView -
  func setupTableView(){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 15),
      tableView.rightAnchor.constraint(equalTo: ingredientsLabel.rightAnchor),
      tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
    ])
    tableView.sizeToFit()
    tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "IdentifierDetail")
    tableView.isScrollEnabled = false
    tableView.tableFooterView = UIView(frame: .zero)
  }
  
}

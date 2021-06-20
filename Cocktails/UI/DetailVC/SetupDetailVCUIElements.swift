//
//  SetupDetailVCUIElements.swift
//  Cocktails
//
//  Created by Ann Yesip on 30.05.2021.
//

import UIKit
import Foundation

extension DetailViewController{
  func setupScrollView(){
    NSLayoutConstraint.activate([
      scroll.topAnchor.constraint(equalTo: view.topAnchor),
      scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    scroll.addSubview(contentView)
  }
  
  func setupContentView() {
    let heightConstraint = contentView.heightAnchor.constraint(
      equalTo: scroll.safeAreaLayoutGuide.heightAnchor
    )
    heightConstraint.priority = UILayoutPriority(rawValue: 250)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scroll.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
      heightConstraint
    ])
    contentView.addSubview(cocktailName)
    contentView.addSubview(cocktailImage)
    contentView.addSubview(saveButton)
    contentView.addSubview(categoryLabel)
    contentView.addSubview(cocktailInstruction)
    contentView.addSubview(firstTableView)
  }

  func setupCocktailsName(){
    NSLayoutConstraint.activate([
      cocktailName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
      cocktailName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
    ])
    cocktailName.font = .boldSystemFont(ofSize: 20)
  }
  
  func setupCocktailImage(){
    NSLayoutConstraint.activate([
      cocktailImage.topAnchor.constraint(equalTo: cocktailName.bottomAnchor, constant: 15),
      cocktailImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      cocktailImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
      cocktailImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9)
    ])
    cocktailImage.layer.masksToBounds = true
    cocktailImage.layer.cornerRadius = 10
    cocktailImage.sizeToFit()
  }
  func setupSaveButton() {
    NSLayoutConstraint.activate([
      saveButton.topAnchor.constraint(equalTo: cocktailImage.topAnchor, constant: 3),
      saveButton.trailingAnchor.constraint(equalTo: cocktailImage.trailingAnchor, constant: -5),
      saveButton.heightAnchor.constraint(equalToConstant: 40),
      saveButton.widthAnchor.constraint(equalToConstant: 40)
    ])

    saveButton.backgroundColor = .white

    saveButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    saveButton.tintColor = .black
    saveButton.layer.cornerRadius = 10
    saveButton.addTarget(self, action: #selector(click), for: .touchUpInside)
  }
  
  func setupCategoryLabel(){
    NSLayoutConstraint.activate([
      categoryLabel.topAnchor.constraint(equalTo: cocktailImage.bottomAnchor, constant: 5),
      categoryLabel.rightAnchor.constraint(equalTo: cocktailImage.rightAnchor),
      categoryLabel.widthAnchor.constraint(equalTo: cocktailImage.widthAnchor)
    ])
    categoryLabel.textColor = .systemGray
  }

  func setupCocktailInstruction(){
    NSLayoutConstraint.activate([
      cocktailInstruction.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
      cocktailInstruction.rightAnchor.constraint(equalTo: categoryLabel.rightAnchor),
      cocktailInstruction.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
    ])
    cocktailInstruction.sizeToFit()
    cocktailInstruction.isScrollEnabled = false
    cocktailInstruction.font = UIFont.systemFont(ofSize: 15)
  }

  //MARK: setup TableView -
  func setupFirstTableView(){
    firstTableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      firstTableView.topAnchor.constraint(equalTo: cocktailInstruction.bottomAnchor, constant: 15),
      firstTableView.rightAnchor.constraint(equalTo: cocktailInstruction.rightAnchor),
      firstTableView.widthAnchor.constraint(equalTo: cocktailInstruction.widthAnchor),
      firstTableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
      firstTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
    ])
    firstTableView.rowHeight = UITableView.automaticDimension
    firstTableView.estimatedRowHeight = 140
    firstTableView.sizeToFit()
    firstTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "IdentifierDetail")
    firstTableView.tableFooterView = UIView()
  }
  
  
  
}

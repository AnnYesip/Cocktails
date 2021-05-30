//
//  DetailViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 29.05.2021.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate {
  var id = String()
  let coreData = CoreDataManager()
  let download  = Download()
  
  var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
  
  //MARK: UIElements -
  var cocktailName = UILabel.createDefaultLabel()
  var cocktailImage = UIImageView.createDefaultImageView()
  var cocktailInstruction = UITextView.createDefaultTextView()
  var ingredientsLabel = UILabel.createDefaultLabel()
  var tableView = UITableView()
  
  //MARK: viewDidLoad -
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(cocktailName)
    view.addSubview(cocktailImage)
    view.addSubview(cocktailInstruction)
    view.addSubview(ingredientsLabel)
    view.addSubview(tableView)
    
    tableView.delegate = self
    tableView.dataSource = self
    
    setupCocktailsName()
    setupCocktailImage()
    setupCocktailInstruction()
    setupIngredientsLabel()
    setupTableView()
    
    updateInterface()
  }
  //MARK:  func -
  func updateInterface(){
    download.downloadSearchByIdCocktails(id: id) {
      let data = self.coreData.fetchSearchByIdCocktail()
      data.forEach { data in
        guard let imageData = data.image else { return }
        self.cocktailImage.image = UIImage(data: imageData)
        self.cocktailName.text = data.name
        self.cocktailInstruction.text = data.strInstructions
      }
    }
  }
  
}



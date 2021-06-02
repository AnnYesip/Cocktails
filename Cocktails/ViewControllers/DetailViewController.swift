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
  
  var ingredients: [String] = []
  
  //MARK: UIElements -
  var cocktailName = UILabel.createDefaultLabel()
  var cocktailImage = UIImageView.createDefaultImageView()
  var categoryLabel = UILabel.createDefaultLabel()
  var cocktailInstruction = UITextView.createDefaultTextView()
  var ingredientsLabel = UILabel.createDefaultLabel()
  var tableView = UITableView()
  
  //MARK: viewDidLoad -
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(cocktailName)
    view.addSubview(cocktailImage)
    view.addSubview(categoryLabel)
    view.addSubview(cocktailInstruction)
    view.addSubview(ingredientsLabel)
    view.addSubview(tableView)
    
    tableView.delegate = self
    tableView.dataSource = self
    
    setupCocktailsName()
    setupCocktailImage()
    setupCategoryLabel()
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
        self.categoryLabel.text = data.strAlcoholic
        self.cocktailInstruction.text = data.strInstructions
        
        self.appendElements(optionalIngredient: data.strIngredient1)
        self.appendElements(optionalIngredient: data.strIngredient2)
        self.appendElements(optionalIngredient: data.strIngredient3)
        self.appendElements(optionalIngredient: data.strIngredient4)
        self.appendElements(optionalIngredient: data.strIngredient5)
        self.appendElements(optionalIngredient: data.strIngredient6)
        self.appendElements(optionalIngredient: data.strIngredient7)
        self.appendElements(optionalIngredient: data.strIngredient8)
        self.appendElements(optionalIngredient: data.strIngredient9)
        self.appendElements(optionalIngredient: data.strIngredient10)
        self.appendElements(optionalIngredient: data.strIngredient11)
        self.appendElements(optionalIngredient: data.strIngredient12)
        self.appendElements(optionalIngredient: data.strIngredient13)
        self.appendElements(optionalIngredient: data.strIngredient14)
        self.appendElements(optionalIngredient: data.strIngredient15)

        self.tableView.reloadData()
      }
    }
  }
  
  func appendElements(optionalIngredient: String?){
    if optionalIngredient != nil {
      guard let data = optionalIngredient else {return}
      if data == "ингредиент отсуцтвует" {
       print(data)
      } else if data == " " {
        print("значение отсуцтвует")
      } else {
        self.ingredients.append(data)
      }

    }

  }
  
}



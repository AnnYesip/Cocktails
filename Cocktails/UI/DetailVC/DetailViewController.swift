//
//  DetailViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 29.05.2021.
//

import UIKit

final class DetailViewController: UIViewController, UITableViewDelegate {
  let coreData = CoreDataManager()
  let cocktailDataManager  = CocktailDataManager()
  let headerTitles = ["Ingredients", "Measure"]
  var ingredients: [String] = []
  var measure: [String] = []
  var id = String()
  
  //MARK: UIElements -
  let scroll = UIScrollView.createDefaultScrollView()
  let contentView = UIView.createDefaultView()
  let cocktailName = UILabel.createDefaultLabel()
  let cocktailImage = UIImageView.createDefaultImageView()
  let saveButton = UIButton.createDefaultButton()
  let categoryLabel = UILabel.createDefaultLabel()
  let cocktailInstruction = UITextView.createDefaultTextView()
  let firstTableView = UITableView()
  
  //MARK: viewDidLoad -
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(scroll)
    view.backgroundColor = .white
    
    firstTableView.delegate = self
    firstTableView.dataSource = self
    firstTableView.tag = 1
    
    setupScrollView()
    setupContentView()
    setupCocktailsName()
    setupCocktailImage()
    setupSaveButton()
    setupCategoryLabel()
    setupCocktailInstruction()
    setupFirstTableView()
    updateInterface()
    
  }
  
  //MARK:  func -
  func updateInterface(){
    cocktailDataManager.downloadSearchByIdCocktails(id: id) {
      let data = self.coreData.fetchSearchByIdCocktail()
      data.forEach { data in
        guard let imageData = data.image else { return }
        self.cocktailImage.image = UIImage(data: imageData)
        self.cocktailName.text = data.name
        self.categoryLabel.text = data.strAlcoholic
        self.cocktailInstruction.text = data.strInstructions
        
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient1)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient2)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient3)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient4)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient5)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient6)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient7)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient8)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient9)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient10)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient11)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient12)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient13)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient14)
        self.appendElementsForIngredien(optionalIngredient: data.strIngredient15)
        
        let queue = DispatchQueue(label: "download_queue", qos: .utility)
        queue.async {
          
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure1)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure2)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure3)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure4)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure5)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure6)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure7)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure8)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure9)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure10)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure11)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure12)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure13)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure14)
          self.appendElementsForMeasure(optionalMeasure: data.strMeasure15)
          DispatchQueue.main.async {
            self.firstTableView.reloadData()
          }
        }
        self.firstTableView.reloadData()
      }
    }
  }
  
  func appendElementsForIngredien(optionalIngredient: String?){
    guard let data = optionalIngredient else {return}
    if data == "ингредиент отсутствует" {
    } else if data == "" {
    } else {
      self.ingredients.append(data)
    }
  }
  
  func appendElementsForMeasure(optionalMeasure: String?){
    guard let data = optionalMeasure else {return}
    if data == "мера отсутствует" {
    } else if data == "" {
    } else {
      self.measure.append(data)
    }
  }
  
  //MARK:- buttomFunc
  
  @objc func click(sender: UIButton) {
    print("save button tapped")
    if sender.currentImage == UIImage(systemName: "bookmark") {
      sender.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
      guard let data = cocktailImage.image?.pngData() else { return }
      guard  let text = cocktailName.text else { return }
      coreData.saveFavouriteCocktails(text, image: data , id: id)
      
    } else {
      sender.setImage(UIImage(systemName: "bookmark"), for: .normal)
      coreData.deleteFavouriteCocktails()
      print("удаляем коктейль")
    }
  }
  
  
  //MARK: deinit -
  deinit {
    print("deallocating \(self)")
  }
  
  
}



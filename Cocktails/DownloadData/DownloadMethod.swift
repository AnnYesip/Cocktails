//
//  DownloadMethod.swift
//  Cocktails
//
//  Created by Ann Yesip on 28.05.2021.
//

import Foundation

class Download{
  
  let coreDataManager = CoreDataManager()
  var networkManager = NetworkManager()
  
  //MARK: AlcoholicData -
  func downloadAlcoholicDataCocktails(completion: @escaping () -> Void) {
    coreDataManager.deleteAllData()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchData(for: .alcoholic) { [unowned self] (cocktails) in
      cocktails.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            coreDataManager.saveAlcoholicCocktails(drink.strDrink, image: data, id: drink.idDrink, strInstructions: drink.strInstructions ?? "рецепт отсутствует")
            completion()
          }
        }
      }
    }
  }
  //MARK: NonAlcoholicData -
  func downloadNonAlcoholicDataCocktails(completion: @escaping () -> Void) {
    coreDataManager.deleteAllData()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchData(for: .nonAlcoholic) { [unowned self] (cocktail) in
      cocktail.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            coreDataManager.saveNonAlcoholicCocktails(drink.strDrink, image: data, id: drink.idDrink, strInstructions: drink.strInstructions ?? "рецепт отсутствует")
            completion()
            
          }
        }
      }
    }
  }
  
  //MARK: Recommended Cocktail Data -
  func downloadRecommendedCocktails(completion: @escaping () -> Void) {
    coreDataManager.deleteAllData()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchData(for: .random) { [unowned self] (cocktail) in
      cocktail.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            coreDataManager.saveRecommendedCocktails(drink.strDrink, image: data, id: drink.idDrink, strInstructions: drink.strInstructions ?? "рецепт отсутствует")
            completion()
            
          }
        }
      }
    }
  }
  
  //MARK: SearchByIdCocktail Data -
  func downloadSearchByIdCocktails(id: String, completion: @escaping () -> Void) {
    coreDataManager.deleteSerchbyIdCocktail()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchDataById(id: id) { cocktail in
      cocktail.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            self.coreDataManager.saveSearchByIdCocktail(drink.strDrink, image: data, id: drink.idDrink, strInstructions: drink.strInstructions ?? "рецепт отсутствует")
            completion()
          }
        }
      }
    }
  }
  
  
}

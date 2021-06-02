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
            self.coreDataManager.saveSearchByIdCocktail(drink.strDrink,
                                                        image: data,
                                                        id: drink.idDrink,
                                                        strAlcoholic: drink.strAlcoholic ?? "category not specified",
                                                        strInstructions: drink.strInstructions ?? "рецепт отсуцтвует",
                                                        strIngredient1: drink.strIngredient1 ?? "ингредиент отсуцтвует",
                                                        strIngredient2: drink.strIngredient2 ?? "ингредиент отсуцтвует",
                                                        strIngredient3: drink.strIngredient3 ?? "ингредиент отсуцтвует",
                                                        strIngredient4: drink.strIngredient4 ?? "ингредиент отсуцтвует",
                                                        strIngredient5: drink.strIngredient5 ?? "ингредиент отсуцтвует",
                                                        strIngredient6: drink.strIngredient6 ?? "ингредиент отсуцтвует",
                                                        strIngredient7: drink.strIngredient7 ?? "ингредиент отсуцтвует",
                                                        strIngredient8: drink.strIngredient8 ?? "ингредиент отсуцтвует",
                                                        strIngredient9: drink.strIngredient9 ?? "ингредиент отсуцтвует",
                                                        strIngredient10: drink.strIngredient10 ?? "ингредиент отсуцтвует",
                                                        strIngredient11: drink.strIngredient11 ?? "ингредиент отсуцтвует",
                                                        strIngredient12: drink.strIngredient12 ?? "ингредиент отсуцтвует",
                                                        strIngredient13: drink.strIngredient13 ?? "ингредиент отсуцтвует",
                                                        strIngredient14: drink.strIngredient14 ?? "ингредиент отсуцтвует",
                                                        strIngredient15: drink.strIngredient15 ?? "ингредиент отсуцтвует")
            completion()
          }
        }
      }
    }
  }
  
  
}

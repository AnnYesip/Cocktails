//
//  NetworkManager.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//

import Foundation

struct NetworkManager {
  let queue = DispatchQueue(label: "download_queue", qos: .utility)
  
  enum RequestType {
    case alcoholic
    case nonAlcoholic
    case random
  }
  
  func fetchData(for requestType: RequestType, completion: @escaping ([ Drink ]) -> Void){
    var urlString = ""
    switch requestType {
    case .alcoholic:
      urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
    case .nonAlcoholic:
      urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    case .random:
      urlString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    }
    guard let url = URL(string: urlString) else { return }
    let session = URLSession.shared
    queue.async {
      session.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
          let json = try JSONDecoder().decode(CocktailsDTO.self, from: data)
          completion(json.drinks)
        }catch let error as NSError {
          print(error)
        }
      }.resume()
    }
  }
  
  func fetchDataById(id: String, completion: @escaping ([ Drink ]) -> Void) {
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)"
    guard let url = URL(string: urlString) else { return }
    let session = URLSession.shared
    queue.async {
      session.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
          let json = try JSONDecoder().decode(CocktailsDTO.self, from: data)
          completion(json.drinks)
        }catch let error as NSError {
          print(error)
        }
      }.resume()
    }
  }
}

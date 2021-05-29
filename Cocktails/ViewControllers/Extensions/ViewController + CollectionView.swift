//
//  ViewController + CollectionView.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//

import Foundation
import  UIKit

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    if (collectionView.tag == 1){
      if coreDataManager.fetchCocktails().count < 5 {
        return coreDataManager.fetchCocktails().count
      } else {
        return 5
      }
    } else if (collectionView.tag == 2){
      if coreDataManager.fetchNonAlcoholicCocktails().count < 5 {
        return coreDataManager.fetchNonAlcoholicCocktails().count
      } else {
        return 5
      }
    }
    return 0
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
    // give space top left bottom and right for cells
    return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        размер ячеек
    return CGSize(width: 250, height: 250)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    
    if (collectionView.tag == 1){
      let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! FirstCollectionViewCell
      cell1.layer.cornerRadius = 10
      
      let cocktail = coreDataManager.fetchCocktails()[indexPath.section]
      cell1.cocktailImage.image = UIImage(data: cocktail.image!)
      cell1.cocktailImage.clipsToBounds = true
      cell1.cocktailsLabel.text = cocktail.name
      return cell1
      
    } else if (collectionView.tag == 2){
      let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: NonAlcoholicCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! NonAlcoholicCollectionViewCell
      cell2.layer.cornerRadius = 10
      
      let cocktail = coreDataManager.fetchNonAlcoholicCocktails()[indexPath.section]
      cell2.cocktailImage.image = UIImage(data: cocktail.image!)
      cell2.cocktailImage.clipsToBounds = true
      cell2.cocktailsLabel.text = cocktail.name
      return cell2
    }
    
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cocktail = coreDataManager.fetchCocktails()[indexPath.section]
    let secondVC = DetailViewController()
    secondVC.id = cocktail.id ?? "1"
    navigationController?.present(secondVC, animated: true)
    
  }
  
  
  
}

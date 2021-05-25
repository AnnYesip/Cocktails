//
//  SetupViewElements.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//
import Foundation
import UIKit

extension ViewController{
  
  func setupNavigationController(){
    navigationController?.navigationBar.backgroundColor = .clear
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                        target: self,
                                                        action: #selector(search) )
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Cocktails"
    
  }
  
  func setupAlcoholicLabel(){
    alcoholicLabel.textColor = .black
    alcoholicLabel.font = .boldSystemFont(ofSize: 20)
    alcoholicLabel.text = "Alcoholic"
    alcoholicLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
    alcoholicLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
  }
  
  func setupAlcoholicButton(){
    alcoholicButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
    alcoholicButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
    alcoholicButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    alcoholicButton.addTarget(self, action: #selector(handleLogOutButton), for: .touchUpInside)
  }
  
  
  func setupCollectionView(){
    firstCollectionView.backgroundColor = .clear
    firstCollectionView.topAnchor.constraint(equalTo: alcoholicLabel.bottomAnchor, constant: 20).isActive = true
    firstCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    firstCollectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    firstCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    firstCollectionView.accessibilityScroll(.right)
    firstCollectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
  }
  
  func setupNonAlcoholicLabel(){
    nonAlcoholicLabel.textColor = .black
    nonAlcoholicLabel.font = .boldSystemFont(ofSize: 20)
    nonAlcoholicLabel.text = "Non-Alcoholic"
    nonAlcoholicLabel.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 20).isActive = true
    nonAlcoholicLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
  }
  
  func setupNonAlcoholicButton(){
    nonAlcoholicButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
    nonAlcoholicButton.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 20).isActive = true
    nonAlcoholicButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    nonAlcoholicButton.addTarget(self, action: #selector(handleLogOutButton2), for: .touchUpInside)
  }
  
  func setupNonAlcoholicCollectionView(){
    nonAlcoholicCollectionView.backgroundColor = .clear
    nonAlcoholicCollectionView.topAnchor.constraint(equalTo: nonAlcoholicLabel.bottomAnchor, constant: 20).isActive = true
    nonAlcoholicCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    nonAlcoholicCollectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    nonAlcoholicCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    nonAlcoholicCollectionView.accessibilityScroll(.right)
  }
  
}

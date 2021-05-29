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
  
  func setupScrollView(){
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    scrollView.addSubview(recommendedView)
    scrollView.addSubview(alcoholicLabel)
    scrollView.addSubview(alcoholicButton)
    scrollView.addSubview(firstCollectionView)
    scrollView.addSubview(nonAlcoholicLabel)
    scrollView.addSubview(nonAlcoholicButton)
    scrollView.addSubview(nonAlcoholicCollectionView)

  }
  
  func setupRecommendedView(){
    NSLayoutConstraint.activate([
      recommendedView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      recommendedView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      recommendedView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.35),
      recommendedView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95)
    ])
    recommendedView.layer.masksToBounds = true
    recommendedView.layer.cornerRadius = 10
    coreDataManager.fetchRecommendedCocktails().forEach { image in
      guard let imageData = image.image else { return }
      guard let image = UIImage(data: imageData) else { return }
      recommendedView.backgroundColor =  UIColor(patternImage: image)
      recommendedView.sendSubviewToBack(recommendedBlurView)
    }
    recommendedView.addSubview(recommendedBlurView)
    recommendedView.addSubview(recommendedLabel)
    recommendedView.addSubview(recommendedImage)
    recommendedView.addSubview(recommendedCocktailName)
    
  }
  
  func setupRecommendedLabel(){
    NSLayoutConstraint.activate([
      recommendedLabel.topAnchor.constraint(equalTo: recommendedView.topAnchor),
      recommendedLabel.centerXAnchor.constraint(equalTo: recommendedView.centerXAnchor),
    ])
    recommendedLabel.text = " we recommend "
//    recommendedLabel.textColor = .systemGray
    recommendedLabel.font = .boldSystemFont(ofSize: 15)
  }
  
  func setupRecommendedImage(){
    NSLayoutConstraint.activate([
      recommendedImage.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: 1),
      recommendedImage.centerXAnchor.constraint(equalTo: recommendedView.centerXAnchor),
      recommendedImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7),
      recommendedImage.heightAnchor.constraint(equalTo: recommendedView.heightAnchor, multiplier: 0.90)
    ])
    
    coreDataManager.fetchRecommendedCocktails().forEach { image in
      guard let imageData = image.image else { return }
      guard let image = UIImage(data: imageData) else { return }
      recommendedImage.image = image
    }
    recommendedImage.layer.masksToBounds = true
    recommendedImage.layer.cornerRadius = 10
    recommendedImage.addSubview(blurView)
    recommendedImage.addSubview(recommendedCocktailName)
    }
  
  func setupBlur(){
    NSLayoutConstraint.activate([
      blurView.bottomAnchor.constraint(equalTo: recommendedCocktailName.bottomAnchor),
      blurView.leadingAnchor.constraint(equalTo: recommendedCocktailName.leadingAnchor),
      blurView.heightAnchor.constraint(equalTo: recommendedCocktailName.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: recommendedCocktailName.widthAnchor)
    ])
  }
  
  func setupRecommendedBlur(){
    NSLayoutConstraint.activate([
      recommendedBlurView.bottomAnchor.constraint(equalTo: recommendedView.bottomAnchor),
      recommendedBlurView.leadingAnchor.constraint(equalTo: recommendedView.leadingAnchor),
      recommendedBlurView.heightAnchor.constraint(equalTo: recommendedView.heightAnchor),
      recommendedBlurView.widthAnchor.constraint(equalTo: recommendedView.widthAnchor)
    ])
  }
  
  func setupRecommendedCocktailName(){
      NSLayoutConstraint.activate([
        recommendedCocktailName.centerXAnchor.constraint(equalTo: recommendedImage.centerXAnchor),
        recommendedCocktailName.bottomAnchor.constraint(equalTo: recommendedImage.bottomAnchor),
        recommendedCocktailName.widthAnchor.constraint(equalTo: recommendedImage.widthAnchor),
        recommendedCocktailName.heightAnchor.constraint(equalTo: recommendedImage.heightAnchor, multiplier: 0.2)
      ])
    
    recommendedCocktailName.sendSubviewToBack(blurView)
    recommendedCocktailName.textAlignment = .center
    recommendedCocktailName.font = .boldSystemFont(ofSize: 20)
    coreDataManager.fetchRecommendedCocktails().forEach { name in
      guard let name = name.name else { return }
      recommendedCocktailName.text = name
    }
    
  }

  func setupAlcoholicLabel(){
    NSLayoutConstraint.activate([
      alcoholicLabel.topAnchor.constraint(equalTo: recommendedView.bottomAnchor, constant: 5),
      alcoholicLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15)
    ])
    alcoholicLabel.textColor = .black
    alcoholicLabel.font = .boldSystemFont(ofSize: 20)
    alcoholicLabel.text = "Alcoholic"
  }
  
  func setupAlcoholicButton(){
    NSLayoutConstraint.activate([
      alcoholicButton.topAnchor.constraint(equalTo: recommendedView.bottomAnchor, constant: 5),
      alcoholicButton.trailingAnchor.constraint(equalTo: recommendedView.trailingAnchor)
    ])
    alcoholicButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
    alcoholicButton.addTarget(self, action: #selector(handleLogOutButton), for: .touchUpInside)
  }
  
  
  func setupCollectionView(){
    NSLayoutConstraint.activate([
      firstCollectionView.topAnchor.constraint(equalTo: alcoholicLabel.bottomAnchor, constant: 20),
      firstCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      firstCollectionView.heightAnchor.constraint(equalToConstant: 250),
      firstCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
    ])
    firstCollectionView.backgroundColor = .clear
    firstCollectionView.accessibilityScroll(.right)
    firstCollectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
  }
  
  func setupNonAlcoholicLabel(){
    NSLayoutConstraint.activate([
      nonAlcoholicLabel.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 20),
      nonAlcoholicLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15)
    ])
    nonAlcoholicLabel.textColor = .black
    nonAlcoholicLabel.font = .boldSystemFont(ofSize: 20)
    nonAlcoholicLabel.text = "Non-Alcoholic"

  }
  
  func setupNonAlcoholicButton(){
    NSLayoutConstraint.activate([
      nonAlcoholicButton.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 20),
      nonAlcoholicButton.trailingAnchor.constraint(equalTo: alcoholicButton.trailingAnchor)
    ])
    nonAlcoholicButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
    nonAlcoholicButton.addTarget(self, action: #selector(handleLogOutButton2), for: .touchUpInside)
  }
  
  func setupNonAlcoholicCollectionView(){
    NSLayoutConstraint.activate([
      nonAlcoholicCollectionView.topAnchor.constraint(equalTo: nonAlcoholicLabel.bottomAnchor, constant: 20),
      nonAlcoholicCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      nonAlcoholicCollectionView.heightAnchor.constraint(equalToConstant: 250),
      nonAlcoholicCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      nonAlcoholicCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
    ])
    nonAlcoholicCollectionView.backgroundColor = .clear
    nonAlcoholicCollectionView.accessibilityScroll(.right)
  }
  
}

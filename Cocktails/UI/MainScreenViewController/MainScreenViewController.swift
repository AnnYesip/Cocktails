//
//  ViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//

import UIKit
import CoreData

final class MainScreenViewController: UIViewController, UICollectionViewDelegate {
  let coreDataManager = CoreDataManager()
  let cocktailDataManager = CocktailDataManager()
  var tableId: Int? = nil
  
  //MARK: UIElements -
  let contentView = UIView.createDefaultView()
  let buttonView = UIView.createDefaultView()
  let recommendedView = UIView.createDefaultView()
  let recommendedLabel = UILabel.createDefaultLabel()
  let recommendedImage = UIImageView.createDefaultImageView()
  let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
  let recommendedCocktailName = UILabel.createDefaultLabel()
  let alcoholicButton = ActualGradientButton()
  let nonAlcoholicButton = ActualGradientButton()
  let lightPinkColor = UIColor.lightPinkColor
  let lightGreyColor = UIColor.lightGrayColor
  let borderColor = UIColor.borderColor
  
  //MARK:- Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tabBarController?.tabBar.layer.masksToBounds = true
    tabBarController?.tabBar.layer.cornerRadius = 15
    tabBarController?.tabBar.layer.borderWidth = 1
    tabBarController?.tabBar.layer.borderColor = borderColor
    tabBarController?.tabBar.barTintColor = .white
    tabBarController?.tabBar.tintColor = lightPinkColor
    tabBarController?.tabBar.unselectedItemTintColor = lightGreyColor
    cocktailDataManager.downloadNonAlcoholicDataCocktails()
    cocktailDataManager.downloadAlcoholicDataCocktails()
    setupNavigationController()
    view.addSubview(contentView)
    setupContentView()
    setupRecommendedView()
    setupRecommendedLabel()
    setupRecommendedImage()
    setupBlur()
    setupButtonView()
    setupRecommendedCocktailName()
    setupAlcoholicButton()
    setupNonAlcoholicButton()
  }
  
  //MARK: NavigationController -
  private func setupNavigationController(){
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Cocktails"
  }
  
  private func setupContentView() {
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    contentView.addSubview(recommendedView)
    contentView.addSubview(buttonView)
  }
  
  //MARK: RecommendedView -
  private func setupRecommendedView() {
    NSLayoutConstraint.activate([
      recommendedView.topAnchor.constraint(equalTo: contentView.topAnchor),
      recommendedView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      recommendedView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
      recommendedView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9)
    ])
    recommendedView.addSubview(recommendedLabel)
    recommendedView.addSubview(recommendedImage)
    recommendedView.addSubview(recommendedCocktailName)
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.openDetailVC(_:)))
    recommendedView.addGestureRecognizer(tap)
  }
  
  private func setupRecommendedImage() {
    NSLayoutConstraint.activate([
      recommendedImage.topAnchor.constraint(equalTo: recommendedView.topAnchor),
      recommendedImage.centerXAnchor.constraint(equalTo: recommendedView.centerXAnchor),
      recommendedImage.widthAnchor.constraint(equalTo: recommendedView.widthAnchor),
      recommendedImage.heightAnchor.constraint(equalTo: recommendedView.heightAnchor)
    ])
    recommendedImage.addSubview(recommendedLabel)
    
    cocktailDataManager.downloadRecommendedCocktails() {
      DispatchQueue.main.asyncAfter(deadline: .now()) {
        self.coreDataManager.fetchRecommendedCocktails().forEach { data in
          guard let imageData = data.image else { return }
          guard let image = UIImage(data: imageData) else { return }
          self.recommendedImage.image = image
          self.recommendedCocktailName.text = data.name
        }
      }
    }
    recommendedImage.layer.masksToBounds = true
    recommendedImage.layer.cornerRadius = 10
    recommendedImage.addSubview(blurView)
    recommendedImage.addSubview(recommendedCocktailName)
  }
  
  private func setupRecommendedLabel() {
    NSLayoutConstraint.activate([
      recommendedLabel.topAnchor.constraint(equalTo: recommendedView.topAnchor),
      recommendedLabel.centerXAnchor.constraint(equalTo: recommendedView.centerXAnchor),
    ])
    recommendedLabel.text = "  cocktail of the day  "
    recommendedLabel.backgroundColor = .black
    recommendedLabel.layer.masksToBounds = true
    recommendedLabel.layer.cornerRadius = 10
    recommendedLabel.textColor = .white
    recommendedLabel.font = .boldSystemFont(ofSize: 15)
  }
  
  private func setupBlur() {
    blurView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      blurView.bottomAnchor.constraint(equalTo: recommendedCocktailName.bottomAnchor),
      blurView.leadingAnchor.constraint(equalTo: recommendedCocktailName.leadingAnchor),
      blurView.heightAnchor.constraint(equalTo: recommendedCocktailName.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: recommendedCocktailName.widthAnchor)
    ])
    blurView.layer.masksToBounds = true
    blurView.layer.cornerRadius = 10
  }
  
  private func setupRecommendedCocktailName() {
    NSLayoutConstraint.activate([
      recommendedCocktailName.centerXAnchor.constraint(equalTo: recommendedImage.centerXAnchor),
      recommendedCocktailName.bottomAnchor.constraint(equalTo: recommendedImage.bottomAnchor),
      recommendedCocktailName.widthAnchor.constraint(equalTo: recommendedImage.widthAnchor),
      recommendedCocktailName.heightAnchor.constraint(equalTo: recommendedImage.heightAnchor, multiplier: 0.20)
    ])
    recommendedCocktailName.sendSubviewToBack(blurView)
    recommendedCocktailName.textAlignment = .center
    recommendedCocktailName.layer.masksToBounds = true
    recommendedCocktailName.layer.cornerRadius = 10
    recommendedCocktailName.font = .boldSystemFont(ofSize: 20)
  }
  
  //MARK: Buttons -
  private func setupButtonView(){
    NSLayoutConstraint.activate([
      buttonView.topAnchor.constraint(equalTo: recommendedView.bottomAnchor, constant: 0),
      buttonView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      buttonView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
      buttonView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
    ])
    buttonView.backgroundColor = .white
    buttonView.layer.cornerRadius = 10
    buttonView.addSubview(alcoholicButton)
    buttonView.addSubview(nonAlcoholicButton)
  }
  
  private func setupAlcoholicButton(){
    alcoholicButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      alcoholicButton.topAnchor.constraint(equalTo: recommendedView.bottomAnchor, constant: 30),
      alcoholicButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      alcoholicButton.heightAnchor.constraint(equalToConstant: 100),
      alcoholicButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9)
    ])
    alcoholicButton.layer.cornerRadius = 10
    alcoholicButton.setTitle("Alcoholic cocktails", for: UIControl.State.normal)
    alcoholicButton.setTitleColor(.white, for: .normal)
    alcoholicButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
    alcoholicButton.addTarget(self, action: #selector(openAlcoholicTV), for: .touchUpInside)
    alcoholicButton.layer.shadowOpacity = 0.3
    alcoholicButton.layer.shadowRadius = 9.0
    alcoholicButton.layer.shadowColor = UIColor.black.cgColor
  }
  
  private func setupNonAlcoholicButton(){
    nonAlcoholicButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nonAlcoholicButton.topAnchor.constraint(equalTo: alcoholicButton.bottomAnchor, constant: 20),
      nonAlcoholicButton.trailingAnchor.constraint(equalTo: alcoholicButton.trailingAnchor),
      nonAlcoholicButton.heightAnchor.constraint(equalToConstant: 100),
      nonAlcoholicButton.widthAnchor.constraint(equalTo: contentView.widthAnchor , multiplier: 0.9)
    ])
    nonAlcoholicButton.setTitle(" Non Alcoholic cocktails", for: UIControl.State.normal)
    nonAlcoholicButton.setTitleColor(.white, for: .normal)
    nonAlcoholicButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
    nonAlcoholicButton.layer.cornerRadius = 10
    nonAlcoholicButton.addTarget(self, action: #selector(openNonAlcoholicTV), for: .touchUpInside)
    nonAlcoholicButton.layer.shadowOpacity = 0.3
    nonAlcoholicButton.layer.shadowRadius = 9.0
    nonAlcoholicButton.layer.shadowColor = UIColor.black.cgColor
  }
  
  //MARK: deinit -
  deinit {
    print("deallocating \(self)")
  }
}


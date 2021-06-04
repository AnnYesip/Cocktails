//
//  SetupViewElements.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//
import Foundation
import UIKit

extension ViewController{
  //MARK: NavigationController -
  func setupNavigationController(){
    navigationController?.navigationBar.backgroundColor = .clear
//    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
//                                                        target: self,
//                                                        action: #selector(search) )
//    navigationItem.rightBarButtonItem?.tintColor = .black
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Cocktails"

  }
  //MARK: setupScrollView -
  func setupScrollView(){
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    scrollView.addSubview(recommendedView)
    scrollView.addSubview(buttonView)


  }
  //MARK: RecommendedView -
  func setupRecommendedView() {
    NSLayoutConstraint.activate([
      recommendedView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      recommendedView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      recommendedView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.45),
      recommendedView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    recommendedView.addSubview(recommendedLabel)
    recommendedView.addSubview(recommendedImage)
    recommendedView.addSubview(recommendedCocktailName)
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    recommendedView.addGestureRecognizer(tap)
  }

  @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
      print("tap tap ")
    let secondVC = DetailViewController()
    
    coreDataManager.fetchRecommendedCocktails().forEach { data in
      guard let cocktailId = data.id else { return }
      secondVC.id = cocktailId
    }

    navigationController?.present(secondVC, animated: true )
  }

  func setupRecommendedImage() {
    NSLayoutConstraint.activate([
      recommendedImage.topAnchor.constraint(equalTo: recommendedView.topAnchor),
      recommendedImage.centerXAnchor.constraint(equalTo: recommendedView.centerXAnchor),
      recommendedImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      recommendedImage.heightAnchor.constraint(equalTo: recommendedView.heightAnchor)
    ])
    recommendedImage.addSubview(recommendedLabel)

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

  func setupRecommendedLabel() {
    NSLayoutConstraint.activate([
      recommendedLabel.topAnchor.constraint(equalTo: recommendedView.topAnchor),
      recommendedLabel.centerXAnchor.constraint(equalTo: recommendedView.centerXAnchor),
    ])
    recommendedLabel.text = " we recommend to try "
    recommendedLabel.textColor = .white
    recommendedLabel.font = .boldSystemFont(ofSize: 15)
  }
  
  
  func setupBlur() {
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

  func setupRecommendedCocktailName() {
      NSLayoutConstraint.activate([
        recommendedCocktailName.centerXAnchor.constraint(equalTo: recommendedImage.centerXAnchor),
        recommendedCocktailName.bottomAnchor.constraint(equalTo: recommendedImage.bottomAnchor),
        recommendedCocktailName.widthAnchor.constraint(equalTo: recommendedImage.widthAnchor),
        recommendedCocktailName.heightAnchor.constraint(equalTo: recommendedImage.heightAnchor, multiplier: 0.25)
      ])

    recommendedCocktailName.sendSubviewToBack(blurView)
//    recommendedCocktailName.backgroundColor = .systemBlue
    recommendedCocktailName.textAlignment = .center
    recommendedCocktailName.layer.masksToBounds = true
    recommendedCocktailName.layer.cornerRadius = 10
    recommendedCocktailName.font = .boldSystemFont(ofSize: 20)
    coreDataManager.fetchRecommendedCocktails().forEach { name in
      guard let name = name.name else { return }
      recommendedCocktailName.text = name
    }

  }

  //MARK: Buttons -
  
  func setupButtonView(){
    NSLayoutConstraint.activate([
      buttonView.topAnchor.constraint(equalTo: recommendedView.bottomAnchor, constant: -15),
      buttonView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      buttonView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.7),
      buttonView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    buttonView.backgroundColor = .white
    buttonView.layer.cornerRadius = 10
    buttonView.addSubview(alcoholicButton)
    buttonView.addSubview(nonAlcoholicButton)
  }
  
  
  func setupAlcoholicButton(){
    NSLayoutConstraint.activate([
      alcoholicButton.topAnchor.constraint(equalTo: recommendedView.bottomAnchor, constant: 40),
      alcoholicButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      alcoholicButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      alcoholicButton.heightAnchor.constraint(equalToConstant: 100),
      alcoholicButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor , multiplier: 0.9)
    ])
    alcoholicButton.backgroundColor = .orange
    alcoholicButton.layer.cornerRadius = 10
    alcoholicButton.setTitle("Alcoholic cocktails", for: UIControl.State.normal)
    alcoholicButton.setTitleColor(.white, for: .normal)
    alcoholicButton.titleLabel?.font = .boldSystemFont(ofSize: 20)

    alcoholicButton.addTarget(self, action: #selector(handleLogOutButton), for: .touchUpInside)

    alcoholicButton.layer.shadowOpacity = 0.3
    alcoholicButton.layer.shadowRadius = 9.0
    alcoholicButton.layer.shadowColor = UIColor.black.cgColor
    
  }
  
  

  func setupNonAlcoholicButton(){
    NSLayoutConstraint.activate([
      nonAlcoholicButton.topAnchor.constraint(equalTo: alcoholicButton.bottomAnchor, constant: 20),
      nonAlcoholicButton.trailingAnchor.constraint(equalTo: alcoholicButton.trailingAnchor),
      nonAlcoholicButton.heightAnchor.constraint(equalToConstant: 100),
      nonAlcoholicButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor , multiplier: 0.9)
    ])
    nonAlcoholicButton.backgroundColor = .orange
    nonAlcoholicButton.setTitle(" Non Alcoholic cocktails", for: UIControl.State.normal)
    nonAlcoholicButton.setTitleColor(.white, for: .normal)
    nonAlcoholicButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
    nonAlcoholicButton.layer.cornerRadius = 10
    nonAlcoholicButton.addTarget(self, action: #selector(handleLogOutButton2), for: .touchUpInside)
    
    nonAlcoholicButton.layer.shadowOpacity = 0.3
    nonAlcoholicButton.layer.shadowRadius = 9.0
    nonAlcoholicButton.layer.shadowColor = UIColor.black.cgColor
  }
  
  //MARK: ButtonsFunc -
  func animateButton(sender: UIButton) {

      sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

      UIView.animate(withDuration: 1.0,
                                 delay: 0,
                                 usingSpringWithDamping: CGFloat(0.20),
                                 initialSpringVelocity: CGFloat(2.0),
                                 options: UIView.AnimationOptions.allowUserInteraction,
                                 animations: {
                                  sender.transform = CGAffineTransform.identity
          },
                                 completion: { Void in()  }
      )
  }
  
  
}

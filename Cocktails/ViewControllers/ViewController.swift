//
//  ViewController.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDelegate {
  let coreDataManager = CoreDataManager()
  let tableVC = TableViewController()
  var tableId: Int? = nil
  let downloadData = Download()
  
  
  
  //MARK: UIElements -
  let scrollView = UIScrollView.createDefaultScrollView()
  let recommendedView = UIView.createDefaultView()
  let recommendedLabel = UILabel.createDefaultLabel()
  let recommendedImage = UIImageView.createDefaultImageView()
  let blurView = UIVisualEffectView.createDefaultVisualEffectView()
  let recommendedBlurView = UIVisualEffectView.createDefaultVisualEffectView()
  let recommendedCocktailName = UILabel.createDefaultLabel()
  let alcoholicLabel = UILabel.createDefaultLabel()
  let alcoholicButton = UIButton.createDefaultButton()
  
  let firstCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collection = UICollectionView(frame: .init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
    
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
    collection.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    return collection
  }()
  
  let nonAlcoholicLabel = UILabel.createDefaultLabel()
  let nonAlcoholicButton = UIButton.createDefaultButton()
  
  let nonAlcoholicCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collection = UICollectionView(frame: .init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
    
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.register(NonAlcoholicCollectionViewCell.self, forCellWithReuseIdentifier: NonAlcoholicCollectionViewCell.reuseIdentifier)
    collection.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    return collection
  }()
  
  
  
  
  //MARK: viewDidLoad -
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray6
    view.addSubview(scrollView)
    firstCollectionView.delegate = self
    firstCollectionView.dataSource = self
    nonAlcoholicCollectionView.delegate = self
    nonAlcoholicCollectionView.dataSource = self
    firstCollectionView.tag = 1
    nonAlcoholicCollectionView.tag = 2
    
    setupNavigationController()
    setupScrollView()
    setupRecommendedView()
    setupRecommendedLabel()
    setupRecommendedImage()
    setupBlur()
    setupRecommendedBlur()
    setupRecommendedCocktailName()
    setupAlcoholicLabel()
    setupAlcoholicButton()
    setupCollectionView()
    setupNonAlcoholicLabel()
    setupNonAlcoholicButton()
    setupNonAlcoholicCollectionView()
    
    updateCollectionView()
    
  }
  
  //MARK: downloadData -
  func updateCollectionView(){
    downloadData.downloadAlcoholicDataCocktails() {
      DispatchQueue.main.asyncAfter(deadline: .now()) {
        self.firstCollectionView.reloadData()
      }
    }
    
    downloadData.downloadNonAlcoholicDataCocktails(){
      DispatchQueue.main.asyncAfter(deadline: .now()) {
        self.nonAlcoholicCollectionView.reloadData()
      }
    }
    

    
    downloadData.downloadRecommendedCocktails(){
      DispatchQueue.main.asyncAfter(deadline: .now()) {
      }
    }
  }
  
  
  
  
  
  
  //MARK: objc func -
  @objc func search() {
    let secondVC = SearchTableViewController()
    secondVC.modalPresentationStyle = .popover
    navigationController?.pushViewController(secondVC, animated: true)
    print("search button")
  }
  
  @objc func handleLogOutButton() {
    tableVC.modalPresentationStyle = .fullScreen
    tableVC.tableView.tag = 1
    tableVC.tableView.reloadData()
    navigationController?.pushViewController(tableVC, animated: true)
    print("open first table view")
  }
  
  @objc func handleLogOutButton2() {
    tableVC.modalPresentationStyle = .fullScreen
    tableVC.tableView.tag = 2
    tableVC.tableView.reloadData()
    navigationController?.pushViewController(tableVC, animated: true )
    print("open second table view")
  }
  //MARK: deinit -
  deinit {
    print("deallocating \(self)")
  }
  

  
  
  
}

//MARK: extension -
extension UIScrollView {
  static func createDefaultScrollView() -> UIScrollView {
    let scroll = UIScrollView()
    scroll.translatesAutoresizingMaskIntoConstraints = false
    return scroll
  }
}


extension UIView {
  static func createDefaultView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
}


extension UILabel {
  static func createDefaultLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
}

extension UIImageView {
  static func createDefaultImageView() -> UIImageView {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }
}

extension UIButton {
  static func createDefaultButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }
}

extension UITextView {
  static func createDefaultTextView() -> UITextView {
    let textField = UITextView()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.isEditable = false
    return textField
  }
}

extension UIVisualEffectView {
  static func createDefaultVisualEffectView() -> UIVisualEffectView {
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    blurView.translatesAutoresizingMaskIntoConstraints = false
    return blurView
  }
}


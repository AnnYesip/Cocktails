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
  let buttonView = UIView.createDefaultView()
  let recommendedView = UIView.createDefaultView()
  let recommendedLabel = UILabel.createDefaultLabel()
  let recommendedImage = UIImageView.createDefaultImageView()
  let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
  let recommendedCocktailName = UILabel.createDefaultLabel()
  let alcoholicButton = UIButton.createDefaultButton()
  let nonAlcoholicButton = UIButton.createDefaultButton()
  var bubble = UIView()
  
  //MARK: viewDidLoad -
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tabBarController?.tabBar.layer.masksToBounds = true
    tabBarController?.tabBar.layer.cornerRadius = 20
    tabBarController?.tabBar.barTintColor = .black
    tabBarController?.tabBar.tintColor = .white
    updateCollectionView()
    view.addSubview(scrollView)
    setupNavigationController()
    setupScrollView()
    setupRecommendedView()
    setupRecommendedLabel()
    setupRecommendedImage()
    setupBlur()
    setupButtonView()
    setupRecommendedCocktailName()
    setupAlcoholicButton()
    setupNonAlcoholicButton()
  }

  //MARK: downloadData -
  func updateCollectionView() {
    downloadData.downloadAlcoholicDataCocktails() {
      DispatchQueue.main.asyncAfter(deadline: .now()) {
      }
    }
    downloadData.downloadNonAlcoholicDataCocktails() {
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
    animateButton(sender: alcoholicButton)
    tableVC.modalPresentationStyle = .fullScreen
    tableVC.tableView.tag = 1
    tableVC.tableView.reloadData()
    navigationController?.pushViewController(tableVC, animated: true)
    print("open first table view")
  }
  
  @objc func handleLogOutButton2() {
    animateButton(sender: nonAlcoholicButton)
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
    let button = UIButton(type: UIButton.ButtonType.system)
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
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    blurView.translatesAutoresizingMaskIntoConstraints = false
    return blurView
  }
}




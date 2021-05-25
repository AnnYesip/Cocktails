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
    var networkManager = NetworkManager()
    let tableVC = TableViewController()
    var tableId: Int? = nil

    
    
    //MARK: UIElements -
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
        view.addSubview(alcoholicLabel)
        view.addSubview(alcoholicButton)
        view.addSubview(firstCollectionView)
        view.addSubview(nonAlcoholicLabel)
        view.addSubview(nonAlcoholicButton)
        view.addSubview(nonAlcoholicCollectionView)
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        nonAlcoholicCollectionView.delegate = self
        nonAlcoholicCollectionView.dataSource = self
        firstCollectionView.tag = 1
        nonAlcoholicCollectionView.tag = 2
        
        setupNavigationController()
        setupAlcoholicLabel()
        setupAlcoholicButton()
        setupCollectionView()
        setupNonAlcoholicLabel()
        setupNonAlcoholicButton()
        setupNonAlcoholicCollectionView()

        downloadDataCocktails()
    }
    
    //MARK: downloadData -
    func downloadDataCocktails() {
        coreDataManager.deleteAllData()
        let queue = DispatchQueue(label: "images", qos: .utility)
        let queue2 = DispatchQueue(label: "images", qos: .utility)
        
        self.networkManager.fetchData(for: .alcoholic) { [unowned self] (cocktails) in
            cocktails.forEach { (drink) in
                guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
                queue.async {
                    guard let data = try? Data(contentsOf: imageUrl) else { return }
                    DispatchQueue.main.async {
                            coreDataManager.saveAlcoholicCocktails(drink.strDrink, image: data, id: drink.idDrink)
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                self.firstCollectionView.reloadData()
                            }
                    }
                }
            }
            
            self.networkManager.fetchData(for: .nonAlcoholic) { [unowned self] (cocktail) in
                cocktail.forEach { (drink) in
                    guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
                    queue2.async {
                        guard let data = try? Data(contentsOf: imageUrl) else { return }
                        DispatchQueue.main.async {
                                coreDataManager.saveNonAlcoholicCocktails(drink.strDrink, image: data, id: drink.idDrink)
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    self.nonAlcoholicCollectionView.reloadData()
                                }
                        }
                    }
                }
            }
        }
    }
    

    
    @objc func search() {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .popover
        navigationController?.present(secondVC, animated: true)
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
    
    deinit {
        print("deallocating \(self)")
    }
    
}

//MARK: extension -
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


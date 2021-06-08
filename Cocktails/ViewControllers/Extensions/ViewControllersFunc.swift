//
//  ViewControllersFunc.swift
//  Cocktails
//
//  Created by Ann Yesip on 08.06.2021.
//

import UIKit

extension ViewController{
  
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
  
  //MARK: objc func open TV -
  @objc func openAlcoholicTV() {
    animateButton(sender: alcoholicButton)
    self.tableVC.modalPresentationStyle = .fullScreen
    self.tableVC.tableView.tag = 1
    self.tableVC.tableView.reloadData()
    self.navigationController?.pushViewController(self.tableVC, animated: true)
    print("open first table view")
  }
  
  @objc func openNonAlcoholicTV() {
    animateButton(sender: nonAlcoholicButton)
    self.tableVC.modalPresentationStyle = .fullScreen
    self.tableVC.tableView.tag = 2
    self.tableVC.tableView.reloadData()
    self.navigationController?.pushViewController(self.tableVC, animated: true)
    print("open second table view")
  }
  
  //MARK: animateButton -
  func animateButton(sender: UIButton) {
    // specify the property you want to animate
    let zoomInAndOut = CABasicAnimation(keyPath: "transform.scale")
    // starting from the initial value 1.0
    zoomInAndOut.fromValue = 1.0
    // to scale down you set toValue to 0.5
    zoomInAndOut.toValue = 0.8
    // the duration for the animation is set to 1 second
    zoomInAndOut.duration = 1.0
    // how many times you want to repeat the animation
    zoomInAndOut.repeatCount = 1
    // to make the one animation(zooming in from 1.0 to 0.5) reverse to two animations(zooming back from 0.5 to 1.0)
    zoomInAndOut.autoreverses = true
    // because the animation consists of 2 steps, caused by autoreverses, you set the speed to 2.0, so that the total duration until the animation stops is 5 seconds
    zoomInAndOut.speed = 7.0
    // add the animation to your button
    sender.layer.add(zoomInAndOut, forKey: nil)
  }
  
  //MARK: open DetailVC -
  @objc func openDetailVC(_ sender: UITapGestureRecognizer? = nil) {
    let secondVC = DetailViewController()
    
    coreDataManager.fetchRecommendedCocktails().forEach { data in
      guard let cocktailId = data.id else { return }
      secondVC.id = cocktailId
    }
    navigationController?.present(secondVC, animated: true )
  }
}

//
//  ViewControllersFunc.swift
//  Cocktails
//
//  Created by Ann Yesip on 08.06.2021.
//

import UIKit

//MARK:- Targerts & actions
extension MainScreenViewController{
  //MARK: objc func open TableView -
  @objc func openAlcoholicTV() {
    let tableVC = TableViewController()
    animateButton(sender: alcoholicButton)
    tableVC.modalPresentationStyle = .fullScreen
    tableVC.tableView.tag = 1
    tableVC.tableView.reloadData()
    navigationController?.pushViewController(tableVC, animated: true)
    print("open alcoholic table view")
  }
  
  @objc func openNonAlcoholicTV() {
    let tableVC = TableViewController()
    animateButton(sender: nonAlcoholicButton)
    tableVC.modalPresentationStyle = .fullScreen
    tableVC.tableView.tag = 2
    tableVC.tableView.reloadData()
    navigationController?.pushViewController(tableVC, animated: true)
    print("open non-alcoholic table view")
  }
  
  @objc func openDetailVC(_ sender: UITapGestureRecognizer? = nil) {
    let secondVC = DetailViewController()
    coreDataManager.fetchRecommendedCocktails().forEach { [weak secondVC = secondVC] data in
      guard let cocktailId = data.id, let secondVC = secondVC  else { return }
      secondVC.id = cocktailId
    }
    navigationController?.present(secondVC, animated: true )
  }
}

//MARK:- Animations
private extension MainScreenViewController {
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
}

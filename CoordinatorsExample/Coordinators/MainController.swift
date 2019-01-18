//
//  MainController.swift
//  CoordinatorsExample
//
//  Created by Alex Ilies on 17/01/2019.
//  Copyright © 2019 hackmajoris. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = ViewController.instantiate()
    vc.coordinator = self
    navigationController.pushViewController(vc, animated: true)
  }
  
  func configure() {
    let vc =  DetailsViewController.instantiate()
    vc.coordinator = self
    
    navigationController.pushViewController(vc, animated: true)
  }
  
  func updateText(text: String?){
    guard let vc = navigationController.viewControllers.first as? ViewController else {
      return
    }
    
    vc.updateLabel(text: text)
  }
}

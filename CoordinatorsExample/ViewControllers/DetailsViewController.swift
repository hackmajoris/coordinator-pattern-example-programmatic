//
//  DetailsViewController.swift
//  CoordinatorsExample
//
//  Created by Alex Ilies on 17/01/2019.
//  Copyright © 2019 hackmajoris. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController, Programmatic {
  
  var coordinator: Coordinator? = nil
  var delegate: UIViewController?
  
  private lazy var textTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.text = ""
    textField.textAlignment = .center
    textField.placeholder = "Write something"
    
    return textField
  }()
  
  override func viewDidLoad() {
    setUpSelf()
    setUpConstraints()
  }
  
  private func setUpSelf(){
    view.backgroundColor = .white
    view.addSubview(textTextField)
  }
  
  private func setUpConstraints(){
    NSLayoutConstraint.activate([
      textTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      textTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      textTextField.widthAnchor.constraint(equalToConstant: 200),
      textTextField.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    if let coordinator = self.coordinator as? MainCoordinator {
      coordinator.updateText(text: textTextField.text)
    }
  }
  
}

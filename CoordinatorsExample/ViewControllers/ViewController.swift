//
//  ViewController.swift
//  CoordinatorsExample
//
//  Created by Alex Ilies on 17/01/2019.
//  Copyright © 2019 hackmajoris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Programmatic {
  weak var coordinator: MainCoordinator?
  
  private lazy var pushMeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Push me", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(pushButtonDidPress(_:)), for: .touchUpInside)
    
    return button
  }()

  private lazy var textLabel : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.numberOfLines = 0
    label.textAlignment = .center
    
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpSelf()
    setUpConstraints()
  }
  
  private func setUpSelf() {
    view.backgroundColor = .white
    view.addSubview(pushMeButton)
    view.addSubview(textLabel)
  }
  
  private func setUpConstraints(){
    NSLayoutConstraint.activate([
      pushMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      pushMeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
      textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  @objc func pushButtonDidPress(_ sender: Any) {
    coordinator?.configure()
  }
  
  func updateLabel(text: String?){
    textLabel.text = text ?? "No text" 
  }
}


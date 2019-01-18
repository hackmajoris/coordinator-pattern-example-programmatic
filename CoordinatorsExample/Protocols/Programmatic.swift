//
//  Storyboarded.swift
//  CoordinatorsExample
//
//  Created by Alex Ilies on 17/01/2019.
//  Copyright © 2019 hackmajoris. All rights reserved.
//

import UIKit

protocol Programmatic {
  static func instantiate() -> Self
}

extension Programmatic where Self: UIViewController {
  static func instantiate() -> Self {
    return Self()
  }
}

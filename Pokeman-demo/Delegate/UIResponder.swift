//
//  UIResponder.swift
//  Pokeman-demo
//
//  Created by Apple on 06/06/2022.
//

import Foundation
import UIKit

extension UIResponder {
    func setRootVC(with window: UIWindow) {
        
        // Configuring FAPanels
        let rootController = HomeViewController()
        
        window.rootViewController  = rootController
        window.makeKeyAndVisible()
        window.backgroundColor = .white
    }
}

//
//  BaseViewController.swift
//  Pokeman-demo
//
//  Created by Apple on 02/06/2022.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        self.configureDataSource()
        self.configureView()
        self.configureCallBacks()
    }
    func configureDataSource() -> Void {
        
    }
    func configureView() -> Void {
        
    }
    func configureCallBacks() -> Void {
        
    }
}

extension UIViewController {
func presentAlertController(_ alertController: UIAlertController, completion: (() -> Void)? = nil) {
    if var topController = SceneDelegate.shared?.window?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        
        DispatchQueue.main.async {
            topController.present(alertController, animated: true, completion: completion)
        }
    }
}
}

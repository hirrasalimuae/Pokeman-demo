//
//  UIView+Extension.swift
//  Pokeman-demo
//
//  Created by Apple on 02/06/2022.
//

import UIKit

extension UIView {

    func createView() {
        let shadows = UIView()

        shadows.frame = self.frame

        shadows.clipsToBounds = false

        self.addSubview(shadows)


        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)

        let layer0 = CALayer()

        layer0.shadowPath = shadowPath0.cgPath

        layer0.shadowColor = UIColor(red: 0.918, green: 0.929, blue: 0.953, alpha: 1).cgColor

        layer0.shadowOpacity = 1

        layer0.shadowRadius = 0

        layer0.shadowOffset = CGSize(width: 0, height: -1)

        layer0.bounds = shadows.bounds

        layer0.position = shadows.center

        shadows.layer.addSublayer(layer0)

    }
   
    func prepareDropShadow(_ radius: CGFloat = 20) {
        layer.shadowColor = UIColor.dropShadow?.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = radius
    }
}

//
//  UIButton+Extension.swift
//  Pokeman-demo
//
//  Created by Apple on 02/06/2022.
//


import UIKit

extension UIButton {

    func createButton(color: UIColor? = .systemBlue,font: UIFont, borderColor: UIColor = .black, bortherWidth: CGFloat = 0, cornerRadius: CGFloat = 0) {
        backgroundColor = .clear
        setTitleColor(color, for: .normal)
        titleLabel?.font = font
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = bortherWidth
        layer.cornerRadius = cornerRadius
    }
   
}


//
//  UIFontExtension.swift
//  Pokeman-demo
//
//  Created by Apple on 02/06/2022.
//

import Foundation

import UIKit

extension UIFont {
    
    static func fontName(_ fontName: FontName = FontName.RobotoRegular, size: CGFloat) -> UIFont {
       
        return UIFont(name: fontName.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

enum FontName: String {
    
    case MontserratBold = "Montserrat-Bold"
    case MontserratLight = "Montserrat-Light"
    case MontserratMedium = "Montserrat-Medium"
    case RobotoBold = "Roboto-Bold"
    case RobotoLight = "Roboto-Light"
    case RobotoMedium = "Roboto-Medium"
    case RobotoRegular = "Roboto-Regular"

}

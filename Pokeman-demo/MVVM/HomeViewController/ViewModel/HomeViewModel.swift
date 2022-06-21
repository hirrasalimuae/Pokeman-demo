//
//  HomeViewModel.swift
//  Pokeman-demo
//
//  Created by Apple on 02/06/2022.
//

import Foundation
fileprivate struct Defaults{
    static var topTitle: String { "Hello World" }
    static var listTitle: String { "Pokemon List" }


}
class HomeViewModel: BaseViewModel {
    var topLabelTitle: String { return Defaults.topTitle }
    var listButtonTitle: String { return Defaults.listTitle }


}


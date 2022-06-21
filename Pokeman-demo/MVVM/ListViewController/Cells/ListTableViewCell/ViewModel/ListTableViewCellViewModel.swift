//
//  ListTableViewCellViewModel.swift
//  Pokeman-demo
//
//  Created by Apple on 17/06/2022.
//

import Foundation

struct ListTableViewCellViewModel {
    let username: String
    let password: String
    var options : OptionVM

    
    init(user: String, password: String, items: [OptionVM]) {
        self.username = user
        self.password = password
        self.options = OptionVM(userName: self.username , password: self.password)
    }

  

    
}



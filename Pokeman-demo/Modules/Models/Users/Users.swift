//
//  Users.swift
//  Pokeman-demo
//
//  Created by Apple on 17/06/2022.
//

import Foundation

struct Users {
    let username: String
    let password: String
    let option : [OptionVM]
    init(info: UserInfo) {
        self.username = info.username ?? ""
        self.password = info.password ?? ""
        self.option = [OptionVM(userName: username, password: password)]
        
    }
}



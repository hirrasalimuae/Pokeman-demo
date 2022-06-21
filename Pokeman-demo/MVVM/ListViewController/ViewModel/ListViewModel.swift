//
//  ListViewModel.swift
//  Pokeman-demo
//
//  Created by Apple on 03/06/2022.
//

import Foundation
fileprivate struct Defaults{
    static var topTitle: String { "Hello World" }
    static var listTitle: String { "Pokemon List" }
    
    
}
class ListViewModel {
    var topLabelTitle: String { return Defaults.topTitle }
    var listButtonTitle: String { return Defaults.listTitle }
    var reloadTable: () -> () = { }
    var usersList = [UserInfo]()
    private var listCellDatasource = [ListTableViewCellViewModel]()
    
    fileprivate var userList: Array<UserInfo> = []
    init() {
        self.getAppData()
    }
    
    private func getAppData() {
        let items  =  DatastoreManager.shared.fetchAllSavedOptions()
        var  usersList = [Users]()
        
        for i in items{
            usersList.append(Users(info: i))
        }
        DispatchQueue.main.async {
            self.prepareCellViewModels(users: usersList)
            self.reloadTable()
        }
        
        
    }
    private func prepareCellViewModels(users: [Users]?) {
        
        guard let userList = users else { return }
        
        //clear all previous data
        usersList.removeAll()
        
        //fetch all the saved data
        //check and apply facility with saved facility
        for users in userList {
            
            let listCellVM = ListTableViewCellViewModel(user: users.username, password: users.password, items: users.option)
            listCellDatasource.append(listCellVM)
        }
        
        
    }
    //MARK: Table Methods
    
    func numberOfSections() -> Int {
        return listCellDatasource.count
    }
    
    
    func cellInfo( for index: Int) -> OptionVM {
        return listCellDatasource[index].options
    }
}

//
//  UserInfo+CoreDataProperties.swift
//  Pokeman-demo
//
//  Created by Apple on 17/06/2022.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension UserInfo : Identifiable {

}

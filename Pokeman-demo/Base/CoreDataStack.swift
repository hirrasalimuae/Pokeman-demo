//
//  CoreDataStack.swift
//  Pokeman-demo
//
//  Created by Apple on 06/06/2022.
//

import Foundation
import CoreData


class CoreDataStack {
    // MARK: - Core Data stack
    
    private init() {
        
    }
    
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Pokeman_demo")
        container.persistentStoreDescriptions.first!.setOption(FileProtectionType.complete as NSObject,forKey: NSPersistentStoreFileProtectionKey)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    class func saveContext () {
        let context = CoreDataStack.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
import Foundation
import CoreData

class DatastoreManager {
    
    public static var shared: DatastoreManager! = nil
    
    var managedContext: NSManagedObjectContext
    
    private init(context: NSManagedObjectContext) {
        self.managedContext = context
    }
    
    public class func shared(context: NSManagedObjectContext) {
        if (self.shared == nil) {
            self.shared = DatastoreManager(context: context)
            self.shared.managedContext = context
        }
    }
    
    public func save(username: String, password: String) {
        // Create Entity
        let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext)
        
        // Initialize Record

//        let encryptedPassword  = EncryptionFile(withPassword: [AppDelegate.self, NSObject.self,NSString.self])
//        let encryptpassword = encryptedPassword.bytesByObfuscatingString(string: password)
        let user = UserInfo(entity: entity!, insertInto: managedContext)
        user.username = username
        user.password = password
        managedContext.performAndWait {
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("could not save, managedobject \(error), \(error.userInfo)")
            }
        }
    }
    
    public func fetchAllSavedOptions() -> [UserInfo] {
        let request: NSFetchRequest<UserInfo> = UserInfo.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result {
                print(data)
            }
            return result
        } catch {
            print("fetch request failed, managedobject")
            return [UserInfo]()
        }
    }
    
    public func deleteAllSavedData() {
        let savedItems = fetchAllSavedOptions()
        for savedItem in savedItems {
            managedContext.performAndWait {
                managedContext.delete(savedItem)
            }
        }
    }
    public func deleteSaveData(_ items: [UserInfo]) {
        for i in items{
            checkWillDeleteItem(i)

        }
        
    }
    func checkWillDeleteItem(_ user: UserInfo){
        let savedItems = fetchAllSavedOptions()
        for i in savedItems{
            if !(i.username == user.username){
                managedContext.performAndWait {
                    managedContext.delete(user)
                }
            }
        }
    }
}

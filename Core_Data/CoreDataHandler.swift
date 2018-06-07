//
//  CoreDataHandler.swift
//  Core_Data
//
//  Created by Anmol's Macbook Air on 07/06/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    // MARK: - Save Data
    
    class func saveObject(firstName: String, lastName: String, number: Int64) -> Bool {
        
        let context = getContext()
        if let entity = NSEntityDescription.entity(forEntityName: "Friends", in: context) {
            
            let manageObject = NSManagedObject(entity: entity, insertInto: context)
            manageObject.setValue(firstName, forKey: "firstname")
            manageObject.setValue(lastName, forKey: "lastname")
        }
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    // MARK: - Fetch Data
    
    class func fetchObject() -> [Friends]? {
        
        let context = getContext()
        var friends : [Friends]? = nil
        
        
        do {
            friends = try context.fetch(Friends.fetchRequest())
            return friends
        }catch {
            return friends
        }
    }
    
    // MARK: - Delete Single Object
    
    class func deleteObject(friend: Friends) -> Bool {
        
        let context = getContext()
        context.delete(friend)
        
        do {
            try context.save()
            return true
        }catch {
            return false
        }
    }
    
    // MARK: - Delete complete core data
    
    class func cleanData() -> Bool {
        
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: Friends.fetchRequest())
        do {
            try context.execute(delete)
            return true
        }catch {
            return false
        }
        
    }
}

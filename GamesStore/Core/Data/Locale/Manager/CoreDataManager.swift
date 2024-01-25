//
//  CoreDataManager.swift
//  GamesStore
//
//  Created by Hendy Nurfrianto on 19/01/24.
//

import Foundation
import CoreData


class DataManager: NSObject, ObservableObject {
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "Games")
    
    override init() {
        super.init()
        container.loadPersistentStores{
            _, error in
            if let error = error {
                fatalError("unable to initialize core data \(error)")
            }
        }
    }
}

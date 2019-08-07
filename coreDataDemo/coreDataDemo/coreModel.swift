//
//  coreModel.swift
//  coreDataDemo
//
//  Created by Rudrarajsinh Chavda on 07/08/19.
//  Copyright © 2019 Rudrarajsinh Chavda. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class stackCoreData : UIViewController {

    //MARK:- Core data stack

    lazy var persistanceContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Songs")
        container.loadPersistentStores(completionHandler: { (sortDesc, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    //MARK:- Core data saving support

    func saveContext() {

        let context = persistanceContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


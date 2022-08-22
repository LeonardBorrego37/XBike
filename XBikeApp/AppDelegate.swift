//
//  AppDelegate.swift
//  XBikeApp
//
//  Created by leonard Borrego on 18/08/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = SplashConfiguration.setup()
        self.window?.rootViewController = viewController
        
        self.window?.makeKeyAndVisible()

        return true
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RouteDataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error  as NSError? {
                
            }
        })
        
        return container
    }()
    
    func saveContext() {
        let context =  persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error: \(nsError)")
            }
        }
    }
}


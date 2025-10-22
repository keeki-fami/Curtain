//
//  CurtainApp.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/18/25.
//

import SwiftUI
import CoreData
import Firebase

@main
struct CurtainApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        var ref: DatabaseReference!
        Database.database().isPersistenceEnabled = true
        ref = Database.database().reference()
        return true
    }
}

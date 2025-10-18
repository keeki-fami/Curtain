//
//  CurtainApp.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/18/25.
//

import SwiftUI
import CoreData

@main
struct CurtainApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

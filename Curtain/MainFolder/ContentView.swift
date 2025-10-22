//
//  ContentView.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/18/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var tabViewSelect: Int = 0
    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    Tab("NextTimer", systemImage: "clock") {
                        NextTimerView()
                    }
                    Tab("WeekSetup", systemImage: "calendar") {
                        WeekSetupView()
                    }
                }
            }
            .navigationTitle("curtain app")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

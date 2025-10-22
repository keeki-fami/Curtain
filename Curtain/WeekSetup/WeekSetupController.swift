//
//  WeekSetupController.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/21/25.
//


import SwiftUI
import FirebaseDatabase
import CoreData

class WeekSetupController {
    let shared = WeekSetupController()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [],
        animation: .default
    ) var newItem: FetchedResults<TimerData>
    
    
    private init() {

    }
//    
//    private func setup() {
//        // TODO: define observe (rxswift)
//    }
    
    func sendData(dayTimers: [String]) {
        newItem.sunday = dayTimers[0]
    }
    
}

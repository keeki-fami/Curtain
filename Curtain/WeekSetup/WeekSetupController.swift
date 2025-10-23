
// MARK: environment,fetchrequestはswiftbaseであり、uikitベースではない（class内で使えない）


//import SwiftUI
//import FirebaseDatabase
//import CoreData
//
//class WeekSetupController {
//    static let shared = WeekSetupController()
//    
//    
//    private init() {
//        
//    }
//    //
//    //    private func setup() {
//    //        // TODO: define observe (rxswift)
//    //    }
//    
//    func setCoreDataToState(dayTimers: Binding<[String]>) {
//        for newitem in newItem {
//            if let sunday = newitem.sunday {
//                dayTimers[0].wrappedValue = sunday
//            }
//            if let monday = newitem.monday {
//                dayTimers[1].wrappedValue = monday
//            }
//            if let tuesday = newitem.tuesday {
//                dayTimers[2].wrappedValue = tuesday
//            }
//            if let wednesday = newitem.wednesday {
//                dayTimers[3].wrappedValue = wednesday
//            }
//            if let thursday = newitem.thursday {
//                dayTimers[4].wrappedValue = thursday
//            }
//            if let friday = newitem.friday {
//                dayTimers[5].wrappedValue = friday
//            }
//            if let saturday = newitem.saturday {
//                dayTimers[6].wrappedValue = saturday
//            }
//        }
//        
//    }
//    
//    func setDataToCoreData(dayTimers: [String]) async {
//        let newTimerData = TimerData(context: context)
//        
//        context.delete(newItem[0])
//        
//        newTimerData.sunday = dayTimers[0]
//        newTimerData.monday = dayTimers[1]
//        newTimerData.tuesday = dayTimers[2]
//        newTimerData.wednesday = dayTimers[3]
//        newTimerData.thursday = dayTimers[4]
//        newTimerData.friday = dayTimers[5]
//        newTimerData.saturday = dayTimers[6]
//        
//        try? context.save()
//    }
//    
//}

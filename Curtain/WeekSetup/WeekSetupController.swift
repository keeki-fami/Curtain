
// MARK: environment,fetchrequestはswiftbaseであり、uikitベースではない（class内で使えない）


import SwiftUI
import FirebaseDatabase
//import CoreData
//
class WeekSetupController {
    
    private var ref: DatabaseReference = Database.database(
        url: "https://curtaintimerdata-default-rtdb.asia-southeast1.firebasedatabase.app/"
    ).reference()
    
    func sendFirebase (dayTimer: [String]) {
        self.ref.child("TimerData").setValue([
            "sunday":"\(dayTimer[0])",
            "monday":"\(dayTimer[1])",
            "tuesday":"\(dayTimer[2])",
            "wednesday":"\(dayTimer[3])",
            "thursday":"\(dayTimer[4])",
            "friday":"\(dayTimer[5])",
            "saturday":"\(dayTimer[6])"
        ])
    }
    
}

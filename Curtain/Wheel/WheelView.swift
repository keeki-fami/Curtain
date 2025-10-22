// WheelView

// TODO: wheelを実装
// TODO: 変更ボタンを実装
// TODO: String -> Data、Data -> Stringを実装

import SwiftUI

struct WheelView: View {
    let weekday:String
    @Binding var stringWeekdayTimer:String
    @Binding var isShowed: Bool
    @State var dateWeekdayTimer: Date = Date()
    @Binding var isAbleToSendFirebase: Bool
    let wheelController = WheelController.shared
    
    var body: some View {
        VStack{
            
            Text("\(weekday)")
            
            DatePicker("", selection: $dateWeekdayTimer, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
            
            Button(action:{
                // MARK: exchange timer type from date to string (for WeekSetupView)
                stringWeekdayTimer = wheelController.dateToString(dateDate: dateWeekdayTimer)
                if wheelController.compareString() {
                    isAbleToSendFirebase = true
                }
                isShowed = false
            },label:{
                Text("変更")
            })
        }
        .onAppear() {
            
            // MARK: exchange timer type from string to date (for DatePicker)
            dateWeekdayTimer = wheelController.stringToDate(stringDate: stringWeekdayTimer)
        }
    }
}

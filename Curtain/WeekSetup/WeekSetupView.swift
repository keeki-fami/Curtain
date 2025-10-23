//
//  WeekSetupView.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/18/25.
//
import SwiftUI
import RxSwift
import RxRelay
import CoreData

struct WeekSetupView: View {
    @State var dayTimer:[String] = Array(repeating: "00:00", count: 7)
    @State var modalIndex = 0
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]
    @State private var isPushed = false
    @State var isAbleToSendFirebase = false
    @State private var isPopup = false
    // let weekSetupController = WeekSetupController.shared
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [],
        animation: .default
    ) var newItem: FetchedResults<TimerData>
    var body: some View {
        
            ScrollView {
                VStack(){
                    
                    VStack {
                        Text("変えたら押してください")
                        
                        if isAbleToSendFirebase {
                            
                            Button(action: {
                                setDataToCoreData()
                                // TODO: firebase送信処理をする
                            }, label: {
                                SendButtonView(buttonColor: Color.blue)
                            })
                        } else {
                            SendButtonView(buttonColor: Color.gray)
                        }
                        
                    }
                    .frame(height:100)
                    
                    // MARK: 半モーダルを七個→各ボタンに対し、同一のモーダルの呼び出し
                    Button(action: {
                        modalIndex = 0
                        isPushed = true
                        print("ボタンを押した")
                    }, label: {
                        WeekButtonView(
                            Timer: $dayTimer[0],
                            weekday: "日"
                        )
                        .frame(height:100)
                    })
                    
                    Button(action: {
                        modalIndex = 1
                        isPushed = true
                        print("ボタンを押した")
                    }, label: {
                        WeekButtonView(
                            Timer: $dayTimer[1],
                            weekday: "月"
                        )
                        .frame(height:100)
                    })
                    
                    Button(action: {
                        modalIndex = 2
                        isPushed = true
                        print("ボタンを押した")
                    }, label: {
                        WeekButtonView(
                            Timer: $dayTimer[2],
                            weekday: "火"
                        )
                        .frame(height:100)
                    })
                    
                    Button(action: {
                        modalIndex = 3
                        isPushed = true
                        print("ボタンを押した")
                    }, label: {
                        
                        WeekButtonView(
                            Timer: $dayTimer[3],
                            weekday: "水"
                        )
                        .frame(height:100)
                    })
                    
                    Button(action: {
                        modalIndex = 4
                        isPushed = true
                        print("ボタンを押した")
                    }, label: {
                        WeekButtonView(
                            Timer: $dayTimer[4],
                            weekday: "木"
                        )
                        .frame(height:100)
                    })
                    
                    Button(action: {
                        modalIndex = 5
                        isPushed = true
                        print("ボタンを押した")
                    }, label: {
                        WeekButtonView(
                            Timer: $dayTimer[5],
                            weekday: "金"
                        )
                        .frame(height:100)
                    })
                    
                    Button(action: {
                        modalIndex = 6
                        isPushed = true
                        print("ボタンを押した")
                    }, label: {
                        WeekButtonView(
                            Timer: $dayTimer[6],
                            weekday: "土"
                        )
                        .frame(height:100)
                    })
                    
                    
                }
            }
            .alert("送信完了",isPresented: $isPopup) {
                
            } message: {
                Text("設定が完了しました。")
            }
            .sheet(isPresented: $isPushed) {
                WheelView(
                    weekday: weekdayList[modalIndex],
                    stringWeekdayTimer: $dayTimer[modalIndex],
                    isShowed: $isPushed,
                    isAbleToSendFirebase: $isAbleToSendFirebase
                )
                    .presentationDetents([.medium])
            }
            .onAppear() {
                setCoreDataToState()
            }
            .onDisappear() {
                isAbleToSendFirebase = false
            }
    }
    
    // MARK: set stored data to dayTimer
    func setCoreDataToState() {
        if let newitem = newItem.first {
            if let sunday = newitem.sunday {
                dayTimer[0] = sunday
            }
            
            if let monday = newitem.monday {
                dayTimer[1] = monday
            }
            
            if let tuesday = newitem.tuesday {
                dayTimer[2] = tuesday
            }
            
            if let wednesday = newitem.wednesday {
                dayTimer[3] = wednesday
            }
            
            if let thursday = newitem.thursday {
                dayTimer[4] = thursday
            }
            
            if let friday = newitem.friday {
                dayTimer[5] = friday
            }
            
            if let saturday = newitem.saturday {
                dayTimer[6] = saturday
            }
        }
    }
    
    func setDataToCoreData() {
        if let newitem = newItem.first {
            context.delete(newitem)
        }
        
        let newitem = TimerData(context: context)
        newitem.sunday = dayTimer[0]
        newitem.monday = dayTimer[1]
        newitem.tuesday = dayTimer[2]
        newitem.wednesday = dayTimer[3]
        newitem.thursday = dayTimer[4]
        newitem.friday = dayTimer[5]
        newitem.saturday = dayTimer[6]
        
        try? context.save()
    }
}

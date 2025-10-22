//
//  WeekSetupView.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/18/25.
//
import SwiftUI
import RxSwift
import RxRelay

struct WeekSetupView: View {
    @State var dayTimer:[String] = Array(repeating: "00:00", count: 7)
    @State var modalIndex = 0
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]
    @State private var isPushed:Bool = false
    @State var isAbleToSendFirebase = false
    var body: some View {
        
            ScrollView {
                VStack(){
                    
                    VStack {
                        Text("変えたら押してください")
                        
                        if isAbleToSendFirebase {
                            Button(action: {
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
            .sheet(isPresented: $isPushed) {
                WheelView(
                    weekday: weekdayList[modalIndex],
                    stringWeekdayTimer: $dayTimer[modalIndex],
                    isShowed: $isPushed,
                    isAbleToSendFirebase: $isAbleToSendFirebase
                )
                    .presentationDetents([.medium])
            }
            .onDisappear() {
                isAbleToSendFirebase = false
            }
    }
}

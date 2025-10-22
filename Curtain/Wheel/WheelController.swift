//
//  WheelController.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/19/25.
//
import SwiftUI
import RxSwift

class WheelController {
    static let shared = WheelController()
    static var beforeString = "00:00"
    static var afterString = "00:00"
    private var dateFormatter = DateFormatter()
    
    private let disposebag = DisposeBag()
    private let valueChanged = PublishSubject<Void>()
    
    private init() {
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ja_JP")
    }
    
    // TODO: exchange type from string to date
    // date format is "hh:mm"
    func stringToDate(stringDate: String) -> Date {
        WheelController.beforeString = stringDate
        let dateDate = dateFormatter.date(from: stringDate)
        if let date = dateDate { return date } else { return Date() }
    }
    
    // TODO: exchange type from date to string
    // date format is "hh:mm"
    func dateToString(dateDate: Date) -> String {
        let stringDate = dateFormatter.string(from: dateDate)
        WheelController.afterString = stringDate
        return stringDate
    }
    
    // TODO: compare beforeString to afterString
    // if they are different, return true
    func compareString() -> Bool {
        if WheelController.beforeString != WheelController.afterString {
            print("異なります。\(WheelController.beforeString) and \(WheelController.afterString)")
            // TODO: buttonの色を変更する処理を書く
            // rxswiftのイベント送信処理を使用したい
            // FIXME: fix the code above this sentence for RxSwift.
            return true
            
        } else {
            print("一緒です。\(WheelController.beforeString) and \(WheelController.afterString)")
            // FIXME: fix the code above this sentence for RxSwift.
            return false
        }
    }
    
}

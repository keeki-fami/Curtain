//
//  TimerDataController.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/18/25.
//
import SwiftUI
import RxSwift

class TimerDataController {
    static let shared = TimerDataController()
    
    private init() {
        
    }
    private let disposeBag: DisposeBag = DisposeBag()
    
    // TODO: sendToFirebase
    // 概要：firabaseにjsondataを送信する
    // 　　　jsondataは、以下に作成するmakeJsonDataで作成する
    // 　  sendToFirebaseでは、データをrequest何とかからfetchする。（クラス内で行けるか）
    
    
    // TODO: makeJsonData
    // 概要：fetchしたTimerDataのデータをjson形式に加工する
}

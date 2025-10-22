//
//  SendButtonView.swift
//  Curtain
//
//  Created by 櫻田聖和 on 10/22/25.
//
import SwiftUI

struct SendButtonView: View {
    let buttonColor: Color
    var body: some View {
        ZStack {
            Rectangle()
                .fill(buttonColor)
                .frame(width:100,height:50)
            Text("送信する")
                .foregroundStyle(.white)
        }
    }
}

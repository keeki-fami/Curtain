// WheekSetupViewでボタンを表示

import SwiftUI

struct WeekButtonView: View {
    @Binding var Timer: String
    let weekday: String
    var body: some View {
        GeometryReader { geometry in
            HStack {
                
                Text("\(weekday)")
                    .foregroundStyle(.white)
                    .padding()
                
                Text("\(Timer)")
                    .frame(height:90)
                    .padding()
                    .foregroundStyle(.white)
                
            }
            .frame(width: geometry.size.width, height: 100)
            .background(.gray)
            
        }
    }
}

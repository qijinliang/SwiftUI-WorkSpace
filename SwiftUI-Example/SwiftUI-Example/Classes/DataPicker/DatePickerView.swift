//
//  DatePickerView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/31.
//

import SwiftUI

struct DatePickerView: View {
    @State private var nextFullMoonDate = Date()
    var body: some View {
        VStack(spacing: 20) {
            
            Text("DatePicker")
                .font(.largeTitle)
                .foregroundColor(.black)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("Bind a date variable to get and set the date in the date picker")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            
            HStack() {
                Spacer()
                Image.init(systemName: "moon.circle")
                    .font(.title)
                    .foregroundColor(Color.yellow)
                    .background(Color.white)
                Spacer()
                //MARK: 圆形
                Circle().frame(width: 60, height: 60)
                    .foregroundColor(Color.yellow)
                Spacer()
                Image.init(systemName: "moon.circle.fill")
                    .font(.title)
                    .foregroundColor(Color.yellow)
                Spacer()
            }
            //MARK: iOS14显示效果和iOS13存在差别
            DatePicker.init("", selection: $nextFullMoonDate, displayedComponents: .date)
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

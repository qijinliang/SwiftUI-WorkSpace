//
//  DatePickerShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/31.
//

import SwiftUI

struct DatePickerShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: DatePickerView()) {
                    Text("日期选择器")
                }
                
                NavigationLink(
                    destination: Picker3View()) {
                    Text("下来选择器")
                }
            }
        }
    }
}

struct DatePickerShowView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerShowView()
    }
}

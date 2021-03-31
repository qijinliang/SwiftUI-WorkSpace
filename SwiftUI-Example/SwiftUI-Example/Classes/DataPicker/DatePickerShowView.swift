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
                    Text("DatePicker1")
                }
                
                NavigationLink(destination: DatePicker2View()) {
                    Text("DatePicker2")
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

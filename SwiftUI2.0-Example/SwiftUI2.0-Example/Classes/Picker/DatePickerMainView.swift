//
//  DatePickerMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/31.
//

import SwiftUI

struct DatePickerMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: DatePickerShowView()) {
                Text("DatePicker")
            }
        }
    }
}

struct DatePickerMainView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerMainView()
    }
}

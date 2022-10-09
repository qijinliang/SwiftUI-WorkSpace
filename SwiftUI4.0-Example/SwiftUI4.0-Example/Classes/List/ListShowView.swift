//
//  ListShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct ListShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: ListView()) {
                    Text("List")
                }
                NavigationLink(destination: ListWithDataView()) {
                    Text("ListWithData")
                }
                NavigationLink(destination: ListGroupedView()) {
                    Text("ListGrouped")
                }
                NavigationLink(destination: CustomerView()) {
                    Text("Customer")
                }
                NavigationLink(destination: ListGroupedView()) {
                    Text("ListGrouped")
                }
                NavigationLink(destination: ListGroupedView()) {
                    Text("ListGrouped")
                }
                NavigationLink(destination: ListSetting()) {
                    Text("ListSetting")
                }
            }
        }
    }
}

struct ListShowView_Previews: PreviewProvider {
    static var previews: some View {
        ListShowView()
    }
}

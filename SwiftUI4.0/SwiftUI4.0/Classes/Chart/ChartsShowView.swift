//
//  ChartsShowView.swift
//  SwiftUI4.0-Example
//
//  Created by 金亮 on 2022/10/11.
//

import SwiftUI

struct ChartsShowView: View {
    var body: some View {
        Form() {
            Section{
                NavigationLink(destination: Chart_SwiftUIView()){
                    Text("ChartView")
                }
                NavigationLink(destination: ChartsShow2View()) {
                    Text("ChartView2")
                }
                NavigationLink(destination: ChartsShow3View()) {
                    Text("ChartView3")
                }
                NavigationLink(destination: ChartsShow4View()) {
                    Text("ChartView4")
                }
                NavigationLink(destination: ChartsShow5View()) {
                    Text("ChartView5")
                }
            }
        }
    }
}

struct ChartsShowView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsShowView()
    }
}

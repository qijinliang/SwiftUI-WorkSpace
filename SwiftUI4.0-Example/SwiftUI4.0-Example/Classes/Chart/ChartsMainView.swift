//
//  ChartsMainView.swift
//  SwiftUI4.0-Example
//
//  Created by Cheney on 2022/10/11.
//

import SwiftUI

struct ChartsMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: ChartsShowView()) {
                Text("ChartView")
            }
            
        }
    }
}

struct ChartsMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsMainView()
    }
}

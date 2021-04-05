//
//  ProjectMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/5.
//

import SwiftUI

struct ProjectMainView: View {
    var body: some View {
        NavigationView() {
            Form() {
                Section() {
                    NavigationLink(destination: WeatherApp()) {
                        Text("WeatherApp")
                    }
                }
            }
            .navigationBarTitle(Text("Project"),displayMode: .inline)
        }
    }
}

struct ProjectMainView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMainView()
    }
}

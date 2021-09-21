//
//  MoveShowView.swift
//  SwiftUI2.0-Example
//
//  Created by Cheney on 2021/9/6.
//

import SwiftUI

struct ChangeShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Change()) {
                    Text("Change")
                }
                
                NavigationLink(destination: ChangeColor()) {
                    Text("ChangeColor")
                }
                
                NavigationLink(destination: ChangeOffset()) {
                    Text("ChangeOffset")
                }
                
                NavigationLink(destination: ChangeShow()) {
                    Text("ChangeShow")
                }
                
                NavigationLink(destination: ChangePoint()) {
                    Text("ChangePoint")
                }
            }
        }
    }
}

struct MoveShowView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeShowView()
    }
}

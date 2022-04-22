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
            Section(header: Text("Section1").font(.title3).fontWeight(.heavy)) {
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
            
            Section(header: Text("Section2").font(.title3).fontWeight(.heavy)) {
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
            
            Section(header: Text("Section3").font(.title3).fontWeight(.heavy)) {
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
            
            Section(header: Text("Section4").font(.title3).fontWeight(.heavy)) {
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

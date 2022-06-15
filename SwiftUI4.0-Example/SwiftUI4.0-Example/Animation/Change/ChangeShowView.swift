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
            Section(header: Text("第一部分").font(.title3).fontWeight(.heavy)) {
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
            
            Section(header: Text("第二部分").font(.title3).fontWeight(.heavy)) {
                NavigationLink(destination: ChangeMenu()) {
                    Text("动画弹出多个按钮")
                }
                
                NavigationLink(destination: ChangePopup()) {
                    Text("弹出自定义视图")
                }
                
                NavigationLink(destination: ChangeAngle()) {
                    Text("角度旋转")
                }
                
                NavigationLink(destination: ChangeShow()) {
                    Text("ChangeShow")
                }
                
                NavigationLink(destination: ChangePoint()) {
                    Text("ChangePoint")
                }
            }
            
            Section(header: Text("第三部分").font(.title3).fontWeight(.heavy)) {
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
            
            Section(header: Text("第四部分").font(.title3).fontWeight(.heavy)) {
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

//
//  AnimationShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/26.
//

import SwiftUI

struct AnimationShowView: View {
    var body: some View {
        NavigationView() {
            Form {

                //MARK: Path
                Section(header: Text("画线").font(.title3).fontWeight(.heavy)) {
                    
                    NavigationLink(destination: PathShowVIew()) {
                        Text("画线画图")
                    }
                }
                
                //MARK: Move
                Section(header: Text("动画").font(.title3).fontWeight(.heavy)) {
                    
                    NavigationLink(destination: ChangeShowView()) {
                        Text("动态动画")
                    }
                    
                    NavigationLink(destination: ImplicitShowView()) {
                        Text("隐式动画")
                    }
                }
            }
            .navigationBarTitle(Text("动画"),displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AnimationShowView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationShowView()
    }
}

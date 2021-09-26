//
//  AnimationShowView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/26.
//

import SwiftUI

struct AnimationShowView: View {
    var body: some View {
        NavigationView() {
            Form {

                //MARK: Path
                Section(header: Text("Path").font(.title3).fontWeight(.heavy)) {
                    
                    NavigationLink(destination: PathShowVIew()) {
                        Text("Path")
                    }
                }
                
                //MARK: Move
                Section(header: Text("Change").font(.title3).fontWeight(.heavy)) {
                    
                    NavigationLink(destination: ChangeShowView()) {
                        Text("Change")
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

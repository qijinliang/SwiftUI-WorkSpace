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
                Section(header: Text("Animation").font(.title3).fontWeight(.heavy)) {
                    NavigationLink(destination: PopSwiftUIView()) {
                        Text("POP")
                    }
                    
                    
                    NavigationLink(destination: AnimationSwiftUIView()) {
                        Text("Animation")
                    }
                    
                    NavigationLink(destination: FoldSwiftUIView()) {
                        Text("Flod")
                    }
                }
                
                //MARK: Path
                Section(header: Text("Path").font(.title3).fontWeight(.heavy)) {
                    
                    NavigationLink(destination: PathShowVIew()) {
                        Text("Path")
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

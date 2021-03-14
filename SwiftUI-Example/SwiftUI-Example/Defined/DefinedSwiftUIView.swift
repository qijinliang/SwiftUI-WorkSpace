//
//  DefinedSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/12.
//

import SwiftUI

struct DefinedSwiftUIView: View {
    var body: some View {
        ZStack {
            Image.init(uiImage: #imageLiteral(resourceName: "赵小臭2"))
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                VStack{
                    Rectangle()
                        .frame(width: 300, height: 220)
                        .foregroundColor(.clear)
                }
                .background(BlurView())
                .cornerRadius(25)
                .frame(maxWidth: .infinity)
            }.padding()
        }
    }
}
struct BlurView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
        
    }
}

struct DefinedSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DefinedSwiftUIView()
    }
}

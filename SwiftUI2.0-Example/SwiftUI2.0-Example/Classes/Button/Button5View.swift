//
//  Button5View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button5View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("With Backgrounds")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("As with most views, we can also customize the background and add a shadow.")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            
            Button(action: {
                print("Solid Button...")
            }){
                Text("Solid Button")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            
            Button(action: {
                print("Solid Button...")
            }){
                Text("Solid With Shadow")
                    .padding(12)
            }
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(10)
            .shadow(color: Color.purple, radius: 20, y: 5.0)
            
            Button(action: {
                print("Solid Button...")
            }){
                Text("Button With Rounded Ends")
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(20.0)
            }
        }
    }
}

struct Button5View_Previews: PreviewProvider {
    static var previews: some View {
        Button5View()
    }
}

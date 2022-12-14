//
//  Button4View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Button4View: View {
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                print("Delete tapped")
            }){
                Label(
                    title: {Text("Delete")
                            .fontWeight(.semibold)
                            .font(.title)
                    }, icon: {
                        Image.init(systemName: "trash")
                            .font(.title)
                    }
                )
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5786082745, green: 0.8915666938, blue: 0.994461596, alpha: 1.0)), Color(#colorLiteral(red: 0.0, green: 0.7790542245, blue: 0.9885957837, alpha: 1.0))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .shadow(radius: 5.0)
            }
            
            Button(action: {
                print("Delete tapped")
            }){
                Label(
                    title: {Text("Share")
                            .fontWeight(.semibold)
                            .font(.title)
                    }, icon: {
                        Image.init(systemName: "square.and.arrow.up")
                            .font(.title)
                    }
                )
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3681973815, green: 0.186875701, blue: 0.9226484895, alpha: 1.0)), Color(#colorLiteral(red: 0.2168135047, green: 0.1025053188, blue: 0.5823028088, alpha: 1.0))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .shadow(radius: 5.0)
            }
            
            Button(action: {
                print("Delete tapped")
            }){
                Label(
                    title: {Text("Delete")
                            .fontWeight(.semibold)
                            .font(.title)
                    }, icon: {
                        Image.init(systemName: "square.and.pencil")
                            .font(.title)
                    }
                )
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.0, green: 0.7790542245, blue: 0.9885957837, alpha: 1.0)), Color(#colorLiteral(red: 0.2168135047, green: 0.1025053188, blue: 0.5823028088, alpha: 1.0))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .shadow(radius: 5.0)
                    .shadow(color: Color(#colorLiteral(red: 0.0, green: 0.6385222077, blue: 0.8448928595, alpha: 1.0)), radius: 20.0, x: 20, y: 10)
            }
        }
    }
}

struct Button4View_Previews: PreviewProvider {
    static var previews: some View {
        Button4View().preferredColorScheme(.dark)
    }
}

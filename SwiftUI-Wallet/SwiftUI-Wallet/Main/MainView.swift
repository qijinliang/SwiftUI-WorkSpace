//
//  MainView.swift
//  SwiftUI-Wallet
//
//  Created by 金亮齐 on 2022/4/4.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                TabView {
                    Group {
                        CreaditCardView()
                    }.padding(.bottom, 40)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 280)
            }
            .navigationTitle("Creadit Cards")
            .navigationBarItems(trailing: addCarButton)
        }
    }
    
    struct CreaditCardView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("Preview of our code eto far")
                    .font(.system(size: 24, weight: .semibold))
                
                HStack {
                    Image("visa")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 44)
                        .clipped()
                    Spacer()
                    
                    Text("Balacne: $5000")
                        .font(.system(size: 18, weight: .semibold))
                }
                
                Text("123 123 123 123 123")
                Text("Create Limie: $5000")
                
                HStack { Spacer() }
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
            .shadow(radius: 5)
            .padding(.horizontal)
            .padding(.top, 8)
        }
    }
    
    var addCarButton: some View {
        Button(action: {
            
        }, label: {
            Text("+ Card")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .background(Color.black)
                .cornerRadius(5)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

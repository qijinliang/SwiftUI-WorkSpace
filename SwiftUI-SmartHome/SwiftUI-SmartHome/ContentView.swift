//
//  ContentView.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var brightnessLevel: CGFloat = 0.9
    private let places = Place.getDummyData()
    @State var selectLightColor = "justPurple"
    @State var selectedPlace = Place()
    @State var placeName: String  = ""
    @State var numberOfLights: String  = ""
    
    var body: some View {
        NavigationView {
            HStack {
                PlacesListComponent(brightnessLevle: self.$brightnessLevel, selectLightColor: self.$selectLightColor, selectedPlace: self.$selectedPlace)
                SliderComponent(selectLightColor: self.$selectLightColor, brightnessLevle: self.$brightnessLevel)
            }.navigationBarItems(leading: Button(action: {

            }) {
                Image(systemName: "arrow.left")
                    .resizable().modifier(NavIconStyle())
            },trailing: trailingButton())
        }
    }
    
    private func trailingButton() -> some View {
        return Button(action: {
            print("Add New place")
        }) {
            Image(systemName: "plus")
                .resizable().modifier(NavIconStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}

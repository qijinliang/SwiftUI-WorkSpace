//
//  PlacesListComponent.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct PlacesListComponent: View {
    
    @Binding var brightnessLevle: CGFloat
    var places: [Place] = Place.getDummyData()
    @Binding var selectLightColor: String
    @Binding var selectedPlace: Place
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(places, id: \.id) { place in
                Button(action: {
                    withAnimation{
                        self.selectLightColor = place.lightColor
                        self.selectedPlace = place
                    }
                }) {
                    PlaceView(brightnessLevel: self.selectedPlace.id == place.id ? self.brightnessLevle : CGFloat(0.5), isSelected: self.selectedPlace.id == place.id, numberOfLights: CGFloat(place.numberOfLights), placeName: place.name, lightColor: place.lightColor)
                }
            }.padding(.horizontal)
        }.onAppear {
            self.selectLightColor = self.places.first?.lightColor ?? "neatRed"
            self.selectedPlace = self.places.first ?? Place()
        }
    }
}

struct PlacesListComponent_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListComponent(brightnessLevle: .constant(0.5), selectLightColor: .constant("neatRed"), selectedPlace: .constant(Place.getDummyData()[0]))
    }
}

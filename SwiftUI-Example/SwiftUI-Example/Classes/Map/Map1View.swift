//
//  Map1View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/8.
//

import SwiftUI
import MapKit

struct Map1View: View {
    @State private var regin : MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var body: some View {
        Map(coordinateRegion: $regin)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Map1View_Previews: PreviewProvider {
    static var previews: some View {
        Map1View()
    }
}

//
//  ContentView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                DiscoverCategoriesView()
                PopularDestinationsView()
                PopularRestaurantsView()
                TrendingCreatorsView()
            }.navigationTitle("旅游")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

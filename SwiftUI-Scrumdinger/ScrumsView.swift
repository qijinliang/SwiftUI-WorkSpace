//
//  ScrumsView.swift
//  SwiftUI-Scrumdinger
//
//  Created by Cheney on 2021/5/18.
//

import SwiftUI

struct ScrumsView: View {
    var scrums: [DailyScrum]
    var body: some View {
        List() {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}){
            Image(systemName: "plus")
        })
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}

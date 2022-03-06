//
//  AccountView.swift
//  SwiftUI-iOS15
//
//  Created by Cheney on 2022/3/6.
//

import SwiftUI

struct AccountView: View {
    
    @State var isDelete = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue,.blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Meng To")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Canada")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Settings",systemImage: "gear")
            }
            
            NavigationLink(destination: ContentView()) {
                Label("Billing",systemImage: "creditcard")
            }
            
            NavigationLink(destination: ContentView()) {
                Label("Help",systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            
            if !isDelete {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Website",systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: { isDelete = true}) {
                        Label("Delete",systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("YouTube",systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            if isPinned {
                Label("Unpin",systemImage: "pin.slash")
            }else {
                Label("Pin",systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

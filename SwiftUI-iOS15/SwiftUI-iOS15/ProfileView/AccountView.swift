//
//  AccountView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/6.
//

import SwiftUI

struct AccountView: View {
    
    @State var isDelete = false
    @State var isPinned = false
    @State var address: Address = Address(id: 1, country: "深圳")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged = false
    
    func fetchAddress() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/address/random_address")!
            let (data, _) = try await  URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
        } catch {
            address = Address(id: 1, country: "深圳")
        }

    }
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
                
                Button {
                    isLogged = false
                    dismiss()
                } label: {
                    Text("退出")
                }
                .tint(.red)
            }
            .task {
                await fetchAddress()
            }
            .refreshable {
                await fetchAddress()
            }
            .listStyle(.insetGrouped)
            .navigationTitle("个人中心")
            .navigationBarItems(trailing: Button {
                dismiss()
            } label: {
                Text("Done").bold()
            })
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
            Text("金亮")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text(address.country)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        
        Section {
            NavigationLink(destination: ContentView()) {
                Label("设置",systemImage: "gear")
            }
            
            NavigationLink(destination: ContentView()) {
                Label("钱包",systemImage: "creditcard")
            }
            
            NavigationLink(destination: ContentView()) {
                Label("帮助中心",systemImage: "questionmark")
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
                        Label("地址",systemImage: "house")
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
                    Label("视频",systemImage: "tv")
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

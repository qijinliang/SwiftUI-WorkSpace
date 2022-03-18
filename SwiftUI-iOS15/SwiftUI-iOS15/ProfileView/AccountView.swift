//
//  AccountView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/6.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @State var address: Address = Address(id: 1, country: "深圳")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @ObservedObject var coinModel = CoinModel()
    
    func fetchAddress() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/address/random_address")!
            let (data, _) = try await URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
        } catch {
            address = Address(id: 1, country: "Error fetching")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
                
                Section {
                    Toggle(isOn: $isLiteMode) {
                        Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                    }
                }
                .accentColor(.primary)
                
                links
                
                coins
                
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
                await coinModel.fetchCoins()
            }
            .refreshable {
                await fetchAddress()
                await coinModel.fetchCoins()
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button { dismiss() } label: { Text("Done").bold() })
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
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
            Text("醉看红尘这场梦")
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
            NavigationLink(destination: HomeView()) {
                Label("设置", systemImage: "gear")
            }
            NavigationLink { Text("Billing") } label: {
                Label("钱包", systemImage: "creditcard")
            }
            NavigationLink { HomeView() } label: {
                Label("帮助", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("网页", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("视频", systemImage: "tv")
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
    
    var coins: some View {
        Section(header: Text("其他")) {
            ForEach(coinModel.coins) { coin in
                HStack {
                    AsyncImage(url: URL(string: coin.logo)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(coin.coin_name)
                        Text(coin.acronym)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
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

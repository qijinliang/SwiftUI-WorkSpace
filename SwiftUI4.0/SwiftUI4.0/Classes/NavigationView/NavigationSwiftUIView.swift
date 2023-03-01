//
//  NavigationSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/11.
//

import SwiftUI

import Combine

struct Update: Identifiable {
    var id = UUID()
    var image: UIImage
    var title: String
    var text: String
}

let updateData = [
    Update(image: #imageLiteral(resourceName: "美食7"), title: "写给我爱的美食", text: "美食，我最爱的女生，在我眼中是那么的可爱，那么的善良，很幸运遇见你，我会好好珍惜你"),
    Update(image: #imageLiteral(resourceName: "美食4"), title: "我爱的美食", text: "美食，我最爱的女生，在我眼中是那么的可爱，那么的善良，很幸运遇见你，我会好好珍惜你"),
    Update(image: #imageLiteral(resourceName: "美食3"), title: "写给我爱的美食", text: "美食，我最爱的女生，在我眼中是那么的可爱，那么的善良，很幸运遇见你，我会好好珍惜你"),
    Update(image: #imageLiteral(resourceName: "美食6"), title: "我爱的美食", text: "美食，我最爱的女生，在我眼中是那么的可爱，那么的善良，很幸运遇见你，我会好好珍惜你"),
    Update(image: #imageLiteral(resourceName: "美食2"), title: "写给我爱的美食", text: "美食，我最爱的女生，在我眼中是那么的可爱，那么的善良，很幸运遇见你，我会好好珍惜你"),
    Update(image: #imageLiteral(resourceName: "美食1"), title: "我爱的美食", text: "美食，我最爱的女生，在我眼中是那么的可爱，那么的善良，很幸运遇见你，我会好好珍惜你")
]


class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

struct NavigationSwiftUIView: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: #imageLiteral(resourceName: "美食1"), title: "最爱的美食", text: "美食，我最爱的女生，在我眼中是那么的可爱，那么的善良，很幸运遇见你，我会好好珍惜你"))
    }
    
    var body: some View {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(uiImage: update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .cornerRadius(80)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete{ index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove{(source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("美食介绍"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("添加")
            },trailing: EditButton())
        .edgesIgnoringSafeArea(.all)
    }
}


struct UpdateDetail: View {
    var update: Update = updateData[1]
    var body: some View{
        List {
            VStack(spacing: 20) {
                Image(uiImage: update.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct NavigationSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSwiftUIView()
    }
}

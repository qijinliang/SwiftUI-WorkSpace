//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.855014, longitude: 2.341231),
        .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        .init(name: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055),
    ]
    
    var body: some View {
        VStack() {
            HStack {
                Text("打卡地点")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("查看所有")
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(destinations,id: \.self) { destination in
                        NavigationLink(destination: PopularDestinationDetailsView(destination: destination), label: {
                            PopularDestinationTitle(destination: destination)
                                .foregroundColor(.black)
                                .padding(.bottom)
                        })
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}



import MapKit

struct PopularDestinationDetailsView: View {
    
    let destination: Destination
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = false
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    
    var body: some View {
        ScrollView {
            
            DestionationHeaderContainer()
                .frame(height: 250)
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top,2)
                
                Text("巴黎（Paris），是法兰西共和国的首都和最大城市，也是法国的政治、经济、文化和商业中心，世界五个国际大都市之一（其余四个分别为纽约、伦敦、东京、香港），并被GaWC评为Alpha+级世界一线城市。 [1-2]巴黎位于法国北部巴黎盆地的中央，横跨塞纳河两岸，城市中心坐标为北纬48°52′、东经2°25′。广义的巴黎有小巴黎和大巴黎之分。小巴黎指大环城公路以内的巴黎城市内，面积105.4平方公里，人口224万；大巴黎包括城区周围的上塞纳省、瓦勒德马恩省、塞纳-圣但尼省、伊夫林省、瓦勒德瓦兹省、塞纳-马恩省和埃松省七个省，共同组成巴黎大区，这片地区在古代就已经被称作“法兰西岛”（ile-de-france），都会区人口约为1100万，占据全国人口的六分之一。 [3]巴黎建都已有1400多年的历史，它不仅是法国，也是西欧的政治、经济和文化中心。2017年8月1日，国际奥委会宣布，巴黎成为2024年奥运会主办城市。2018年1月20日，法国总理爱德华·菲利普正式向法国负责世博会申办工作的部际代表帕斯卡尔·拉米提出，出于财政预算方面的考虑，巴黎将退出申办2025年世博会。 [4")
                    .padding(.top,4)
                
                HStack { Spacer() }
            }
            .padding(.horizontal)
            
            HStack {
                Text("Location").font(.system(size: 18, weight: .semibold))
                Spacer()
                
                Button(action: {
                    isShowingAttractions.toggle()
                }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 12, weight: .semibold))
                })
                Toggle("",isOn: $isShowingAttractions)
                    .labelsHidden()
            }.padding(.horizontal)
            
            
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }.frame(height: 300)
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        .init(name: "Eiffel Tower",imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees",imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "art2",latitude: 48.860288, longitude: 2.337789)
    ]
    
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    
    let name,imageName: String
    let latitude, longitude: Double
}


struct CustomMapAnnotation: View {
    
    let attraction: Attraction
    
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(4)
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical,4)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
        }.shadow(radius: 5)
    }
}

//: [Previous](@previous)

import SwiftUI
import UIKit
import PlaygroundSupport


struct DayDataPoint: Identifiable {
    let id = UUID()
    let day: String
    let value: CGFloat
}

struct ContentView: View{
    
    static let data: [DayDataPoint] = [
        .init(day: "周天", value: 0.2),
        .init(day: "周一", value: 0.5),
        .init(day: "周二", value: 0.3),
        .init(day: "周三", value: 0.8),
        .init(day: "周四", value: 0.7),
        .init(day: "周五", value: 0.4),
        .init(day: "周六", value: 1.0),
    ]
    
    static let afternoonData: [DayDataPoint] = [
        .init(day: "周天", value: 0.1),
        .init(day: "周一", value: 0.6),
        .init(day: "周二", value: 0.2),
        .init(day: "周三", value: 0.3),
        .init(day: "周四", value: 0.4),
        .init(day: "周五", value: 0.9),
        .init(day: "周六", value: 0.5),
    ]
    
    static let eveningData: [DayDataPoint] = [
        .init(day: "周天", value: 0.9),
        .init(day: "周一", value: 0.4),
        .init(day: "周二", value: 0.3),
        .init(day: "周三", value: 0.3),
        .init(day: "周四", value: 0.5),
        .init(day: "周五", value: 0.2),
        .init(day: "周六", value: 0.1),
    ]
    
    @State var dataSet = [
        data, afternoonData,eveningData
    ]
    
    var spacing: CGFloat = 24
    @State var selectedTime = 0
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Color(.sRGB, red: 94/255, green: 244/255, blue: 198/255, opacity: 1)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Spacer()
                    Text("图表")
                        .font(.system(size: 32))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(red: 14/255, green: 75/255, blue: 58/255 ))
                        .padding(.bottom, 0)
                    
                    Picker(selection: self.$selectedTime, label: Text("What is yourfavorite color?")) {
                        Text("早上").tag(0)
                        Text("下午").tag(1)
                        Text("晚上").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    HStack(spacing: self.spacing){
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][0], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][1], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][2], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][3], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][4], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][5], width: (geometry.size.width - 8 * self.spacing) / 7)
                        StackedBarView(dataPoint: self.dataSet[self.selectedTime][6], width: (geometry.size.width - 8 * self.spacing) / 7)
                    }.animation(.default)
                    Spacer()
                }
            }
        }
    }
}


struct StackedBarView: View {
    var dataPoint: DayDataPoint
    var width: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: width, height: 300)
                .overlay(RoundedRectangle(cornerRadius: 20).fill(Color(.sRGB, red: 74/255, green: 231/255, blue: 184/255)))
                
                Capsule()
                    .frame(width: width, height: dataPoint.value * 300)
                    .overlay(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            }
            .padding(.bottom, 8)
            Text(dataPoint.day)
                .font(.system(size: 14))
        }
    }
}


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)

//
//  AngularButton.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/18.
//

import SwiftUI

struct AngularButton: View {
    var title = ""
    @State var tap = false
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var body: some View {
        Text(completedLongPress ? "加载中..." : title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(
                ZStack {
                    angularGradient
                    LinearGradient(gradient: Gradient(colors: [Color(.systemBackground).opacity(1), Color(.systemBackground).opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                        .cornerRadius(20)
                        .blendMode(.softLight)
                }
            )
            .frame(height: 50)
            .accentColor(.primary.opacity(0.7))
            .scaleEffect(isDetectingLongPress ? 0.8 : 1)
    }
    
    var angularGradient: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.clear)
            .overlay(AngularGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0, green: 0.5199999809265137, blue: 1, alpha: 1)), location: 0.0),
                    .init(color: Color(#colorLiteral(red: 0.2156862745, green: 1, blue: 0.8588235294, alpha: 1)), location: 0.4),
                    .init(color: Color(#colorLiteral(red: 1, green: 0.4196078431, blue: 0.4196078431, alpha: 1)), location: 0.5),
                    .init(color: Color(#colorLiteral(red: 1, green: 0.1843137255, blue: 0.6745098039, alpha: 1)), location: 0.8)]),
                center: .center
            ))
            .padding(6)
            .blur(radius: 20)
    }
}

struct AngularButton_Previews: PreviewProvider {
    static var previews: some View {
        AngularButton()
    }
}

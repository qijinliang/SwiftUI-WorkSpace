//
//  HStack7View.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/2.
//

import SwiftUI

struct HStack7View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack")
                .font(.largeTitle)
                .foregroundColor(.black)
            Text("Layout Priority")
                .font(.title)
                .foregroundColor(.gray)
            VStack() {
                Text("Use the layoutPriority modifier to give priority to the space a view needs to show its content. ")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            Text(".layoutPriority(1)is set on 'Brings Balance'")
                .font(.body)
            
            HStack() {
                Text("Writing SwiftUI code is fun").lineLimit(1)
                Image.init("placeholder")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
                Text("Blanance")
                    .layoutPriority(1)
            }
            .font(.largeTitle)
            
            HStack() {
                Text("SwiftUI").layoutPriority(1)
                Image.init("placeholder")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
                Text("Writing SwiftUI code is fun")
                    .lineLimit(1)
            }
            .font(.largeTitle)
            
            Text(".layoutPriority(1)is set on 'SwiftUI'")
                .font(.body)
        }
        
    }
}

struct HStack7View_Previews: PreviewProvider {
    static var previews: some View {
        HStack7View()
    }
}

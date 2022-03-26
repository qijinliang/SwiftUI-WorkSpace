//
//  PopularDestinationTitle.swift
//  SwiftUI-Discover
//
//  Created by 金亮齐 on 2022/2/26.
//

import SwiftUI

struct PopularDestinationTitle: View {
    
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(4)
                .padding(.horizontal,6)
                .padding(.vertical,6)
            
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal,12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal,12)
                .padding(.bottom,8)
                .foregroundColor(.gray)
        }.asTile()
            .padding(.bottom)
    }
}

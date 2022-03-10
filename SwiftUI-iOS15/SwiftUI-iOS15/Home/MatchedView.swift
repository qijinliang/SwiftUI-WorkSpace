//
//  MatchedView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/8.
//

import SwiftUI

struct MatchedView: View {
    
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
          
            }else{

                
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}

//
//  PictureList.swift
//  SwiftUI-Picture
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct PictureList: View {
    
    var pictures = Picture.data()
    @State var selectedPicture: Picture?
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Text("请点击预览图片")

                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.pictures) { picture in
                            Image(picture.imageName)
                                .resizable()
                                .aspectRatio(4/7, contentMode: .fit)
                                .frame(width: 40)
                                .cornerRadius(3)
                                .shadow(radius: 3)
                                .onTapGesture {
                                    withAnimation {
                                        self.selectedPicture = picture
                                    }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .blur(radius: self.selectedPicture != nil ? 20 : 0)
            
            if self.selectedPicture != nil {
                PicturePreview(pictures: pictures, selectedPicture: $selectedPicture)
            }
        }
    }
}

struct PictureList_Previews: PreviewProvider {
    static var previews: some View {
        PictureList()
    }
}

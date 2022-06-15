//
//  Form1View.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/31.
//

import SwiftUI

struct Form1View: View {
    var body: some View {
        Form() {
            Section() {
                Text("This is a Form!")
                    .font(.title)
                Text("You can put any content in here")
                Text("The cells will grow to fit the content")
                Text("Remember, it's just views inside of views")
                    .font(.title3)
            }
            
            Section() {
                Text("Limitations")
                    .font(.title)
                Text("There are built-in margins that are difficult to get around.Take a look at the color bellow so you can see where the margins are:")
                    .font(.title3)
                Color.purple
            }
            
            Section() {
                Text("Summary")
                    .font(.title)
                Text("Pretty much what you see here is what you get.")
                    .font(.title3)
            }
        }
    }
}

struct Form1View_Previews: PreviewProvider {
    static var previews: some View {
        Form1View()
    }
}

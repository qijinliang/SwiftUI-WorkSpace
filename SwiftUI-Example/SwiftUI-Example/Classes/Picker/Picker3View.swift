//
//  Picker3View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/5/1.
//

import SwiftUI

struct Picker3View: View {
    @State private var faoriteState = 1
    @State private var youName = "Mark"
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Picker")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
            
            VStack() {
                Text("You associate a variable with the picker rows'tag values")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.5098315477, green: 0.6478956938, blue: 0.5974430442, alpha: 1)))
            
            Picker.init(selection: $faoriteState, label: Text("States")) {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Vermont").tag(2)
            }
            .padding(.horizontal)
            
            VStack() {
                Text("Tag values can be String, Int or Bool.")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.5098315477, green: 0.6478956938, blue: 0.5974430442, alpha: 1)))
            
            
            Picker.init(selection: $youName, label: Text("Picker"), content: {
                Text("Paul").tag(1)
                Text("Chris").tag(2)
                Text("Mark").tag(3)
                Text("Scott").tag(4)
                Text("Meng").tag(5)
            })
            .padding(.horizontal)
            
        }
    }
}

struct Picker3View_Previews: PreviewProvider {
    static var previews: some View {
        Picker3View().preferredColorScheme(.dark)
    }
}

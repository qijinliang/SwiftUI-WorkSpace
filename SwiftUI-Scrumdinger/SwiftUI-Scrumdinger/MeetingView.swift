//
//  MeetingView.swift
//  SwiftUI-Scrumdinger
//
//  Created by Cheney on 2021/5/18.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack() {
            ProgressView.init(value: 5,total: 15)
            HStack() {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption2)
                    HStack() {
                        Image.init(systemName: "hourglass.tophalf.fill")
                        Text("300")
                            .font(.callout)
                    }
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Elapsed")
                        .font(.caption2)
                    HStack() {
                        Image.init(systemName: "hourglass.bottomhalf.fill")
                        Text("600")
                            .font(.callout)
                    }
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time remaining"))
            .accessibilityValue(Text("10 minutes"))
            
            Circle().strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 24, antialiased: true)
            
            HStack() {
                Text("Speaker 1 of 3")
                Spacer()
                Button.init(action: {}) {
                    Image.init(systemName: "forward.fill")
                }
                .accessibilityLabel(Text("Next speaker"))
            }
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}

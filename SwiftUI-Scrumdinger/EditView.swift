//
//  EditView.swift
//  SwiftUI-Scrumdinger
//
//  Created by Cheney on 2021/5/19.
//

import SwiftUI

struct EditView: View {
    @Binding var scrumData: DailyScrum.Data
    @State private var newAttendee = ""
    var body: some View {
        List {
            Section(header: Text("Metting Info")) {
                TextField("Title",text: $scrumData.title)
                
                HStack() {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ColorPicker("Color",selection: $scrumData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self) { attendee in
                    Text(attendee)
                }.onDelete(perform: { indices in
                    scrumData.attendees.remove(atOffsets: indices)
                })
                
                HStack() {
                    TextField("New Attendee", text: $newAttendee)
                    Button.init(action: {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                        }
                        newAttendee = ""
                    }, label: {
                        Image.init(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("add attendee"))
                    })
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(scrumData: .constant(DailyScrum.data[0].data))
    }
}

//
//  ContentView.swift
//  SwiftUI-List
//
//  Created by Jerry on 2019/11/5.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let image: UIImage
    let jobTitle: String
}



struct PeopleList: View {
    
   @State var people: [Person] = [
        .init(firstName: "Steve", lastName: "Jobs",image:#imageLiteral(resourceName: "jobs"),jobTitle: "Founder of Apple"),
        .init(firstName: "Steve", lastName: "Jobs",image:#imageLiteral(resourceName: "jobs"),jobTitle:"Founder of Apple"),
        .init(firstName: "Steve", lastName: "Jobs",image:#imageLiteral(resourceName: "jobs"),jobTitle:"Founder of Apple")
    ]
    
    var body: some View {
        
        NavigationView {
            List(people) { person in
                PersonRow(person: person, didDelete: { p in
                    self.people.removeAll( where: {$0.id == person.id } )
                })
            }.navigationBarTitle("People")
        }
    }
}

struct PersonRow: View {
    var person: Person
    var didDelete: (Person) -> ()
    
    var body: some View {
        HStack {
           Image(uiImage: person.image)
               .resizable()
               .scaledToFill()
               .frame(width: 60, height: 60)
               .overlay(RoundedRectangle(cornerRadius: 60).strokeBorder(style: StrokeStyle(lineWidth: 2))
                   .foregroundColor(Color.black))
               .cornerRadius(60)
           
           VStack (alignment: .leading) {
               Text("\(person.firstName) \(person.lastName)")
                   .fontWeight(.bold)
               Text(person.jobTitle)
                   .fontWeight(.light)
           }.layoutPriority(1)
           Spacer()
           
           Button(action: {
            self.didDelete(self.person)
           }, label: {
               Text("Delete")
                   .foregroundColor(.white)
                   .fontWeight(.bold)
                   .padding(.all, 12)
                   .background(Color.red)
               .cornerRadius(3)
           })
           
       }.padding(.vertical, 8)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleList()
    }
}

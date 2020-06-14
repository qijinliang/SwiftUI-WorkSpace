//
//  BuyTicketsView.swift
//  SwiftUI-Movies
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct BuyTicketsView: View {
    let movie = Movie(name: "The Shape of Water", imageName: "1")
    
    let topDays: [Day] = [
        .init(month: "MAR", day: "09", dayOfWeek: "FRIDAY"),
        .init(month: "MAR", day: "10", dayOfWeek: "SATURDAY"),
        .init(month: "MAR", day: "11", dayOfWeek: "SUNDAY"),
        .init(month: "MAR", day: "12", dayOfWeek: "MONDAY"),
        .init(month: "MAR", day: "13", dayOfWeek: "TUESDAY"),
    ]
    
    let middleDays: [Day] = [
        .init(month: "MAR", day: "14", dayOfWeek: "WEDNESDAY"),
        .init(month: "MAR", day: "15", dayOfWeek: "FRIDAY"),
        .init(month: "MAR", day: "16", dayOfWeek: "SATURDAT"),
        .init(month: "MAR", day: "17", dayOfWeek: "SUNDAY"),
        .init(month: "MAR", day: "18", dayOfWeek: "MONDAY"),
    ]
    
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 16) {
                
                HStack {
                    Text("Buy TICKETS")
                        .font(.system(size: 20))
                }
                
                HStack (alignment: .top, spacing: 16) {
                    Image("1")
                        .frame(width: 150, height: 200)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("The Shape of Water")
                            .font(.system(size: 18, weight: .bold))
                        Text("Drama|Fantasy")
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("MAR 10 FRIDAT")
                                    .font(.system(size: 14))
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 24).stroke(Color.gray, lineWidth: 1)
                                )
                                    .foregroundColor(.black)
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("7:00PM")
                                    .font(.system(size: 14))
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 24).stroke(Color.gray, lineWidth: 1)
                                )
                                    .foregroundColor(.black)
                            })
                        }
                    }.padding(.top, 12)
                }
                VStack(alignment: .leading, spacing: 16){
                    HStack {
                        Text("Select Date")
                        Spacer()
                    }.padding(.leading, 16)
                    
                    HStack(spacing: 16) {
                        ForEach(self.topDays) { day in
                            DayButton(day: day, size: geo.size, selectedDay: self.selectedDay, tapHandler: { (d) in
                                self.selectedDay = d
                                print(d.month)
                            })
                        }
                    }.padding(.horizontal, 16)
                    
                    HStack(spacing: 16) {
                        ForEach(self.middleDays) { day in
                            DayButton(day: day, size: geo.size, selectedDay: self.selectedDay, tapHandler: { (d) in
                                self.selectedDay = d
                                print(d.month)
                            })
                        }
                    }.padding(.horizontal, 16)
                }
                
                Spacer()
            }
        }
        
    }
    
    @State var selectedDay: Day?
}

struct DayButton: View {
    
    let day: Day
    let size: CGSize
    let selectedDay: Day?
    let tapHandler: ((Day) ->())?
    
    var body: some View {
        Button(action: {
            self.tapHandler?(self.day)
        }, label: {
            VStack(spacing: 8) {
                Text("MAR")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor((self.selectedDay?.day != day.day) ? Color.gray : Color.white)
                Text(day.day)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor((self.selectedDay?.day != day.day) ? Color.gray : Color.white)
                Text(day.dayOfWeek)
                    .font(.system(size: 10))
                    .foregroundColor((self.selectedDay?.day != day.day) ? Color.gray : Color.white)
            }.padding(.vertical, 8)
            
        }).foregroundColor(.black)
            .padding(.horizontal, 2)
            .frame(width: (size.width - 6 * 16) / 5)
            .overlay(
                RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1)
        )
            .background((self.selectedDay?.day == day.day) ? Color.red : Color.white)
            .cornerRadius(12)
    }
}

struct Day: Identifiable{
    let id = UUID()
    let month, day, dayOfWeek: String
}

struct BuyTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        BuyTicketsView()
    }
}

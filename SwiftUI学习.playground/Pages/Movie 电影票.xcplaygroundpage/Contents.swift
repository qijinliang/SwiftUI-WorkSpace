//: [Previous](@previous)


import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        BuyTicketsView()
    }
}


struct Movie: Identifiable, Hashable {
    let id = UUID.init()
    let name: String
    let imageName: UIImage
}

struct Day: Identifiable{
    let id = UUID()
    let month, day, dayOfWeek: String
}

struct BuyTicketsView: View {
    
    let movie = Movie(name: "车票", imageName: #imageLiteral(resourceName: "车模.jpg"))
    
    let topDays: [Day] = [
        .init(month: "日期", day: "09", dayOfWeek: "周一"),
        .init(month: "日期", day: "10", dayOfWeek: "周二"),
        .init(month: "日期", day: "11", dayOfWeek: "周三"),
        .init(month: "日期", day: "12", dayOfWeek: "周四"),
        .init(month: "日期", day: "13", dayOfWeek: "周五"),
    ]
    
    let middleDays: [Day] = [
        .init(month: "日期", day: "14", dayOfWeek: "周六"),
        .init(month: "日期", day: "15", dayOfWeek: "周天"),
        .init(month: "日期", day: "16", dayOfWeek: "周一"),
        .init(month: "日期", day: "17", dayOfWeek: "周二"),
        .init(month: "日期", day: "18", dayOfWeek: "周三"),
    ]
    
    var body: some View {
        
        GeometryReader { geo in
            VStack (spacing: 16) {
                
                HStack {
                    Text("详细信息")
                        .font(.system(size: 20))
                }
                
                HStack (alignment: .top, spacing: 16) {
                    Image(uiImage: self.movie.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 250)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("车模展览")
                            .font(.system(size: 18, weight: .bold))
                        Text("汽车")
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("星期五")
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
                        Text("选择日期")
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
                Text("日期")
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


PlaygroundPage.current.setLiveView(ContentView())


//: [Next](@next)

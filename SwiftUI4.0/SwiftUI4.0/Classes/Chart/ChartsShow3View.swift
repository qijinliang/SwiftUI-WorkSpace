//
//  ChartsShow3View.swift
//  SwiftUI4.0-Example
//
//  Created by 金亮 on 2022/10/11.
//

import SwiftUI
import Charts

struct ChartsShow3View: View {
    let weekdays = Calendar.current.shortWeekdaySymbols
    let steps = [10631,6019,7200,8311,7401,6503,9230]
    
    var body: some View {
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark (
                    x: .value("Steps", steps[index]),
                    y: .value("Day", weekdays[index])
                )
                .foregroundStyle(by: .value("Day", weekdays[index]))
                .annotation{
                    Text("\(steps[index])")
                    
                }
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct ChartsShow3View_Previews: PreviewProvider {
    static var previews: some View {
        ChartsShow3View()
    }
}

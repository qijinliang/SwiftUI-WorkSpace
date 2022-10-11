//
//  ChartsShow2View.swift
//  SwiftUI4.0-Example
//
//  Created by Cheney on 2022/10/11.
//

import SwiftUI
import Charts

struct ChartsShow2View: View {
    
    let weekdays = Calendar.current.shortWeekdaySymbols
    let steps = [10631,6019,7200,8311,7401,6503,9230]
    
    var body: some View {
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark (
                    x: .value("Day", weekdays[index]),
                    y: .value("Steps", steps[index])
                )
                .foregroundStyle(by: .value("Day", weekdays[index]))
                .annotation{
                    Text("\(steps[index])")
                    
                }
            }
        }
    }
}

struct ChartsShow2View_Previews: PreviewProvider {
    static var previews: some View {
        ChartsShow2View()
    }
}

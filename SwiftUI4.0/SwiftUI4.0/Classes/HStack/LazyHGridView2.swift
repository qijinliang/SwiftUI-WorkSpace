//
//  GridView.swift
//  SwiftUI4.0
//
//  Created by Cheney on 2023/6/15.
//

import SwiftUI

struct LazyHGridView2: View {
    var body: some View {
        ScrollView {
            Text("Grid Layout")
                .font(.largeTitle).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
            
            grid
            
            Grid {
                GridRow {
                    Text("Votes")
                    Text(" ")
                    Text("Rating")
                }
                .gridColumnAlignment(.leading)
                .font(.footnote)
                .foregroundColor(.secondary)
                
                GridRow {
                    Text("4")
                    ProgressView(value: 0.1)
                    RatingView(rating: 1)
                }
                GridRow {
                    Text("1")
                    ProgressView(value: 0.1)
                    RatingView(rating: 2)
                }
                GridRow {
                    Text("5")
                    ProgressView(value: 0.2)
                    RatingView(rating: 3)
                }
                GridRow {
                    Text("124")
                    ProgressView(value: 0.5)
                    RatingView(rating: 4)
                }
                GridRow {
                    Text("654")
                    ProgressView(value: 0.9)
                    RatingView(rating: 5)
                }
            }
            .padding(20)
        }
    }
    
    var grid: some View {
        Grid {
            GridRow {
                card.gridCellColumns(2)
            }
            GridRow {
                card
                card
            }
            GridRow {
                card.gridCellColumns(2)
            }
        }
        .padding(.horizontal, 30)
    }
    
    var card: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 200)
    }
}

struct RatingView: View {
    var rating = 3
    let list = [1, 2, 3, 4, 5]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(list, id: \.self) { item in
                Image(systemName: rating >= item ? "star.fill" : "star")
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView2()
    }
}

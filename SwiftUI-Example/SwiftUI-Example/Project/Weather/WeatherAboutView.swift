//
//  WeatherAboutView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/5/1.
//

import SwiftUI
import MarkdownUI

struct WeatherAboutView: View {
    //MARK: - SwiftUI解析md文件
    private var weatherMarkdwon: Document? {
        guard let path = Bundle.main.path(forResource: "高仿天气", ofType: "md")  else {
            return nil
        }
        
        return try? Document(contentsOfFile: path)
    }
    var body: some View {
        ScrollView() {
            Markdown.init(weatherMarkdwon!)
                .padding()

        }
    }
}

struct WeatherAboutView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAboutView()
    }
}

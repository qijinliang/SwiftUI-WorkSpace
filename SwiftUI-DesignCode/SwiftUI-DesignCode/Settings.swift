//
//  Settings.swift
//  SwiftUI-DesignCode
//
//  Created by Jerry on 2019/11/26.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct Settings: View {

   @State var receive = false
   @State var number = 1
   @State var selection = 1
   @State var date = Date()
   @State var email = ""
   @State var submit = false

   var body: some View {
      NavigationView {
         Form {
            Toggle(isOn: $receive) {
               Text("收到通知")
            }
            Stepper(value: $number, in: 1...10) {
               Text("\(number) 通知\(number > 1 ? "s" : "") 这周")
            }
            Picker(selection: $selection, label: Text("最喜欢的课程")) {
               Text("SwiftUI").tag(1)
               Text("React").tag(2)
            }
            DatePicker(selection: $date, label: {
               Text("日期")
            })
            Section(header: Text("邮箱")) {
               TextField("你的邮箱: ", text: $email)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: { self.submit.toggle() }) {
               Text("提交")
            }
            .alert(isPresented: $submit, content: {
               Alert(title: Text("谢谢"), message: Text("邮箱: \(email)"))
            })
         }
         .navigationBarTitle("设置")
      }
   }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
   static var previews: some View {
      Settings()
   }
}
#endif

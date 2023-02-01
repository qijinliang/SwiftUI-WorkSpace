//
//  AddCardForm.swift
//  SwiftUI-Wallet
//
//  Created by Cheney on 2022/12/14.
//

import SwiftUI

struct AddCardForm: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var cardNumber = ""
    @State private var limit = ""
    @State private var cardType = "信用卡"
    @State private var month = 1
    @State private var year = Calendar.current.component(.year, from: Date())
    @State private var color = Color.blue
    
    let currentYear = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("信用卡信息")) {
                    TextField("姓名", text: $name)
                    TextField("信用卡号", text: $cardNumber).keyboardType(.numberPad)
                    TextField("信用卡额度", text: $limit).keyboardType(.numberPad)
                    
                    Picker("类型",selection: $cardType) {
                        ForEach(["Visa", "Mastercard", "Discover", "Citibank"], id: \.self) { cardType in
                            Text(String(cardType)).tag(String(cardType))
                        }
                    }
                }
                
                Section(header: Text("到期")) {
                    Picker("月份",selection: $year) {
                        ForEach(currentYear..<currentYear + 20, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                }
                
                Section(header: Text("颜色")) {
                    ColorPicker("Color",selection: $color)
                }
            }
            .navigationTitle("添加卡")
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("返回")
            }))
        }
    }
}

struct AddCardForm_Previews: PreviewProvider {
    static var previews: some View {
        AddCardForm()
    }
}

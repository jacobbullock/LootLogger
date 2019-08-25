//
//  ItemDetailView.swift
//  LootLogger
//
//  Created by jacob on 8/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import SwiftUI

struct FormFieldView: View {
    let title: String
    let placeholder: String
    @Binding var value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            TextField(placeholder, text: $value)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct ItemDetailView : View {
    
    var item: Item
    
    var body: some View {
        Form {
            Section(header: Text("Information")) {
                HStack {
                    Text("Loot ID")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(item.id)")
                        .lineLimit(1)
                        .font(.subheadline)
                }
            }
            Section(header: Text("Edit")) {

                FormFieldView(title: "Name",
                              placeholder: "",
                              value: .constant("\(item.name)"))
                    
                FormFieldView(title: "Serial",
                              placeholder: "",
                              value: .constant("\(item.serial)"))
                    
                FormFieldView(title: "Value",
                              placeholder: "",
                              value: .constant("\(item.itemValue)"))
          }
        }
        .navigationBarTitle("Item Detail")
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item.random)
    }
}

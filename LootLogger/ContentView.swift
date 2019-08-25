//
//  ContentView.swift
//  LootLogger
//
//  Created by jacob on 8/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let items = [Item.random, Item.random, Item.random]
    var body: some View {
        NavigationView {
            List(items) { item in
                NavigationLink(destination: ItemDetailView(item: item)) {
                    ItemRow(item: item)
                }
            }
            .navigationBarTitle(Text("LootLogger"))
        }
    }
}

struct ItemRow: View {
    var item: Item
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .padding(.bottom, 2)
                Text(item.serial)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("$\(item.itemValue)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Fructus
//
//  Created by clydies freeman on 12/21/20.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    var fruits: [Fruit] = fruitsData

    @State private var isShowingSettings: Bool = false
    
    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item),
                        label: {
                            FruitRowView(fruit: item)
                                .padding(.vertical, 4)
                        })
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
                Button(action: {
                    isShowingSettings = true

                }, label: {
                    Image(systemName: "slider.horizontal.3")
                })) //: Button
            .sheet(isPresented: $isShowingSettings, content: {
                SettingsView()
            })
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

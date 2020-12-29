//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by clydies freeman on 12/22/20.
//

import SwiftUI

struct FruitNutrientsView: View {
    
    // MARK: - PROPERTIES
    let nutrients: [String] = ["Energy", "Sugar", "Fat","Protien", "Minerals", "Vitamins"]
    var fruit: Fruit
    
    // MARK: - BODY
    
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutrional value per 100g"){
                ForEach(0 ..< nutrients.count, id: \.self) { item in
                    
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        } // : BOX
    }
}


// MARK: - PREVIEW

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}

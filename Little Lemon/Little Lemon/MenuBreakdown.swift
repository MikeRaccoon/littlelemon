//
//  MenuBreakdown.swift
//  Little Lemon
//
//  Created by Mike on 2/24/23.
//

import SwiftUI

struct MenuBreakdown: View {
    @Binding var name: String
    @Binding var selected: Bool
    private let menuSectionNames = ["starters", "mains", "desserts", "drinks"]
    
    var body: some View {
        VStack {
            Text("ORDER FOR DELIVERY!")
            
            HStack(spacing: 5) {
                Button("Menu") {
                    name = ""
                    selected = false
                }
                .background(colorFromHex("E9EBEA").cornerRadius(8))
                
                ForEach(menuSectionNames, id: \.self) { name in
                    Button(name.capitalized) {
                        self.name = name
                        selected = true
                    }
                    .frame(maxWidth: 80, maxHeight: 30)
                    .background(colorFromHex("E9EBEA").cornerRadius(8))
                }
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal, 10)
    }
}

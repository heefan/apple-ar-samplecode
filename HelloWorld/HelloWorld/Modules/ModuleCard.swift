//
//  ModuelCard.swift
//  HelloWorld
//
//  Created by LI Tian on 4/11/23.
//

import SwiftUI

struct ModuleCard: View {
    var body: some View {
        
        NavigationLink(value: "") {
            VStack(alignment: .leading, spacing: 4) {
                Text("A Day in the Life")
                    .font(.callout)
                    .bold()
                    .foregroundStyle(.secondary)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Planet Earth")
                        .font(.largeTitle)
                    Text("A lot goes into making a day happen on Planet Earth! Discover how our globe turns and tilts to give us hot summer days, chilly autumn nights, and more.")
                }
            }
            .padding(.vertical, 30)
        }
        .buttonStyle(.borderless)
        .buttonBorderShape(.roundedRectangle(radius: 20))
        .frame(minWidth: 200, maxWidth: 355)
    }
}
    

#Preview {
    HStack {
        ModuleCard()
        ModuleCard()
        ModuleCard()
    }
    .padding()
    .glassBackgroundEffect()
}

//
//  TableOfContent.swift
//  HelloWorld
//
//  Created by LI Tian on 4/11/23.
//

import SwiftUI

struct TableOfContents: View {
    var body: some View {
        VStack {
            Image("SunSliver")
            
            Spacer(minLength: 120)

            VStack {
                Text("Hello World")
                Text("Discover a new wya of looking at the world")
            }
            .alignmentGuide(.earthGuide)  { context in
                context[VerticalAlignment.top]
            }
            
            HStack(alignment: .top, spacing: 30) {
                ModuleCard()
                ModuleCard()
                ModuleCard()
            }
        }
        .background(alignment: Alignment(horizontal: .center, vertical: .earthGuide)) {
            Image("EarthHalf")
                .alignmentGuide(.earthGuide) { context in
                    context[VerticalAlignment.top] + 100
                }
                .accessibility(hidden: true)
        }
    }
}


extension VerticalAlignment {
    private struct EarthAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }
    
    fileprivate static let earthGuide = VerticalAlignment(
        EarthAlignment.self
    )
}


#Preview {
    TableOfContents()
}

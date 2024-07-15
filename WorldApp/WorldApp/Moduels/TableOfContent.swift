//
//  TableOfContent.swift
//  WorldApp
//
//  Created by LI Tian on 15/7/24.
//

import SwiftUI

struct TableOfContent : View {
    var body: some View {
        
        VStack {
            TitleText(title: "Hello world")
                .padding(.horizontal, 70)
                .hidden()
                .overlay(alignment: .leading) {
                    TitleText(title: "")
                        .padding(.leading, 70)
                }
            Text("Discover a new way of looking at the world.",
                 comment: "The app's subtitle, appearing immediately below the title in a smaller font, on the splash screen.")
            .font(.title)
        }

        Spacer()
    }
}


private struct TitleText: View {
    var title: String
    var body: some View {
        Text(title)
            .monospaced()
            .font(.system(size: 50, weight: .bold))
    }
}

extension VerticalAlignment {
    /// A custom alignment that pins the background image to the title.
    private struct EarthAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }

    /// A custom alignment guide that pins the background image to the title.
    fileprivate static let earthGuide = VerticalAlignment(
        EarthAlignment.self
    )
}


#Preview {
    TableOfContent()
}


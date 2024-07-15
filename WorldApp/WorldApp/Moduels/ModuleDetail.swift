//
//  ModuelDetial.swift
//  WorldApp
//
//  Created by LI Tian on 15/7/24.
//

import SwiftUI

struct ModuleDetail: View {
    var module: Module
    
    
    var body: some View {
        GeometryReader { proxy in
            
            let textWidth = min(max(proxy.size.width * 0.4, module == .orbit ? 500 : 300), 500)
            let imageWidth = min(max(proxy.size.width - textWidth, 300), 700)
            
            ZStack {
                HStack(spacing: 60) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(module.heading)
                            .font(.system(size: 50, weight: .bold))
                            .padding(.bottom, 15)
                            .accessibilitySortPriority(4)

                        Text(module.overview)
                            .padding(.bottom, 24)
                            .accessibilitySortPriority(3)
                        
                        switch module {
                        case .globe:
                            Text("todo - globe")
                        case .orbit:
                            Text("todo - orbit")
                        case .solar:
                            Text("todo - solar")
                        }
                    }
                    .frame(width: textWidth, alignment: .leading)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        }
        .padding([.leading, .trailing], 70)
        .padding(.bottom, 24)
        .background {
            if module == .solar {
                Image("SolarBackground")
                    .resizable()
                    .scaledToFill()
                    .accessibility(hidden: true)
            }
        }
    }
}


#Preview {
    HStack {
        ModuleDetail(module: .globe)
        ModuleDetail(module: .orbit)
        ModuleDetail(module: .solar)
    }
}

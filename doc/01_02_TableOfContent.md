# 01.2  Build `TableOfContent` Page

### Preview


### Requirement

1. Make the static layout
2. Action: when launch the screen, it will show "Hello World"
3. Action: when hover on the box, it will highlight the ModuleCard


```swift
struct TableOfContent : View {
    var body: some View {
        
        VStack {
            Image("SunSliver")
                .opacity(1)
                .accessibility(hidden: true)
            
            Spacer(minLength: 120)
            
            VStack {
                TitleText(title: "Hello World")
                    .padding(.horizontal, 70)
                    .hidden()
                    .overlay(alignment: .leading) {
                        TitleText(title: "")
                            .padding(.leading, 70)
                    }
                Text("Discover a new way of looking at the world.",
                     comment: "The app's subtitle, appearing immediately below the title in a smaller font, on the splash screen.")
                .font(.title)
                .opacity(1)
            }
            .alignmentGuide(.earthGuide) { context in
                context[VerticalAlignment.top]
            }
            .padding(.bottom, 24)
            
            HStack(alignment: .top, spacing: 30) {
                ForEach(Module.allCases) {
                    ModuleCard(module: $0)
                }
            }
            .padding(.bottom, 8)
            .opacity(1)
            
            Spacer()
        }
        .padding(.horizontal, 50)
        .background(alignment: Alignment(horizontal: .center, vertical: .earthGuide)) {
            Image("EarthHalf")
                .alignmentGuide(.earthGuide) { context in
                    context[VerticalAlignment.top] + 100
                }
                .opacity(1)
                .accessibility(hidden: true)
        }
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
    TableOfContent()
}
```


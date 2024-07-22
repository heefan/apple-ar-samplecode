# Keypoint

```swift
struct Globe: View {
    @Environment(ViewModel.self) private var model

    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = fal
    
}
```

1. @State creates a source of truth for a value type.
2. It's typically used for local, mutable state in a view.
3. Changes to @State properties trigger view updates.


example,

```swift
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1
            }
        }
    }
}

struct ToggleView: View {
    @State private var isOn = false

    var body: some View {
        Toggle("Switch", isOn: $isOn)
    }
}

struct TextFieldView: View {
    @State private var name = ""

    var body: some View {
        TextField("Enter your name", text: $name)
    }
}

struct SliderView: View {
    @State private var sliderValue: Double = 0.5

    var body: some View {
        Slider(value: $sliderValue, in: 0...1)
    }
}
```

@State is used to create mutable properties that, when changed, will cause the view to update. The $ symbol is used to create a binding to the state, which is often required for interactive controls like TextField, Toggle, and Slider.
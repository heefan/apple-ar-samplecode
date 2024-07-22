@MainActor is a Swift attribute introduced with the concurrency model in Swift 5.5. It's used to indicate that a class, structure, or function should only be accessed on the main dispatch queue, which is typically used for updating the user interface.
Here's a brief explanation of @MainActor:

Purpose: It ensures that the marked code runs on the main thread, which is crucial for UI operations in iOS.
Thread safety: It helps prevent race conditions and other concurrency-related issues by restricting access to the main thread.
Compile-time checking: The compiler can verify that @MainActor-marked code is only called from the main thread or other @MainActor-marked contexts.

In the example you provided:

```swift
@MainActor required init() {
    super.init()
}
```

This initialiser is marked with @MainActor, meaning:

It will always be called on the main thread.
Any properties or methods accessed within it are guaranteed to be on the main thread.
It can only be called from other @MainActor-marked contexts or from async code using await.

@MainActor is particularly useful in view models or other classes that interact with UI components, ensuring that UI updates always happen on the main thread, which is a requirement in iOS development.
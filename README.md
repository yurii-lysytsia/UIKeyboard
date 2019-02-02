# UIKeyboard

[![platform](https://img.shields.io/badge/Platform-iOS%208%2B-blue.svg)]()
[![language](https://img.shields.io/badge/Language-Swift-red.svg)]()
[![language](https://img.shields.io/badge/pod-4.0.0-blue.svg)]()
[![license](https://img.shields.io/badge/license-MIT-lightgray.svg)]()

- [Requirements](#requirements)

- [Installation](#installation)
    - [CocoaPods](#CocoaPods)
    
- [Usage](#usage)
    
- [License](#license)

## Requirements

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## Installation
### Cocoa pods
To integrate `UIKeyboard` into your Xcode project using [CocoaPods](http://cocoapods.org), create `Podfile`.  Run the following command in root folder of your project:

```bash
$ pod init
```
In the `Podfile` that appears, specify:

```ruby
platform :ios, ‘8.0’

target '<Your Target Name>' do
    use_frameworks!
    pod 'UIKeyboard'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
1. By default `UIViewController` have `UIKeyboard` property with `keyboard` name which notify about keyboard appearance changes

```swift
class UIKeyboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Default UIViewController keyboard property
        self.keyboard
        
    }
    
}
```

2. You can use `UIKeyboard` observers with closure or(and) delegate. Choose a method that is more convenient for you.

-  with `UIKeyboardDelegate`:

```swift
class UIKeyboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add delegate to default UIViewController keyboard property
        self.keyboard.delegate = self

    }

}

extension UIKeyboardViewController: UIKeyboardDelegate {

    func keyboardWillShow(with info: UIKeyboard.Info) {
        // Posted immediately prior to the display of the keyboard
    }

    func keyboardDidShow(with info: UIKeyboard.Info) {
        // Posted immediately after the display of the keyboard.
    }

    func keyboardWillHide(with info: UIKeyboard.Info) {
        // Posted immediately prior to the dismissal of the keyboard.
    }

    func keyboardDidHide(with info: UIKeyboard.Info) {
        // Posted immediately after the dismissal of the keyboard.
    }

}
```

- with closures

```swift
class UIKeyboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.keyboard.willShow { (info) in
            // Posted immediately prior to the display of the keyboard
        }

        self.keyboard.didShow { (info) in
            // Posted immediately after the display of the keyboard.
        }

        self.keyboard.willHide { (info) in
            // Posted immediately prior to the dismissal of the keyboard.
        }

        self.keyboard.didHide { (info) in
            // Posted immediately after the dismissal of the keyboard.
        }

    }

}
```

3. `UIKeyboard.Info` have next properties:
```swift
/// Rect that identifies the ending frame rectangle of the keyboard in screen coordinates. The frame rectangle reflects the current orientation of the device.
public let frame: CGRect

/// Time interval that identifies the duration of the animation in seconds.
public let animationDuration: TimeInterval

/// Animation curve constant that defines how the keyboard will be animated onto or off the screen.
public let animationCurve: UIView.AnimationCurve

/// Animation options constant that defines how the keyboard will be animated onto or off the screen.
public var animationOptions: UIView.AnimationOptions
```

- Simple example of `info` usege for change `scrollView` content inset:
```swift
self.keyboard.willShow { (info) in
    UIView.animate(withDuration: info.animationDuration, delay: 0, options: info.animationOptions, animations: {
        self.scrollView.contentInset.bottom = info.frame.height
    }, completion: nil)
}
```

## License
Released under the MIT license. See [LICENSE](https://github.com/YuriFox/UIKeyboard/blob/master/LICENSE) for details.

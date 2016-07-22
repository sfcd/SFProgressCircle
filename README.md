# SFProgressCircle

A circular gradient progress view implementation for iOS with efficient drawing using a series of arcs with linear gradient.

<img src="https://raw.githubusercontent.com/sfcd/SFProgressCircle/master/Example/Resources/scr.png" alt="Example Usage" width="320" height="569" />

## Requirements

- iOS 8.0+
- Xcode 6.3+

## Communication

- If you **need help**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation
> **Embedded frameworks require a minimum deployment target of iOS 8.**

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SFProgressCircle into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SFProgressCircle'
end
```

Then, run the following command:

```bash
$ pod install
```

##License
SFCircleGradientProgress is available under the MIT license. See the LICENSE file for more info.

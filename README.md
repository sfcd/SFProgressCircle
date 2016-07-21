# SFProgressCircle

A circular gradient progress view implementation with efficient drawing using a series of arcs with linear gradient.

## Requirements

- iOS 8.0+
- Xcode 6.3+

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/alamofire). (Tag 'alamofire')
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation
> **Embedded frameworks require a minimum deployment target of iOS 8 or OS X Mavericks (10.9).**

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build Alamofire 3.0.0+.

To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire', '~> 3.4'
end
```

Then, run the following command:

```bash
$ pod install
```

##License
SFCircleGradientProgress is available under the MIT license. See the LICENSE file for more info.

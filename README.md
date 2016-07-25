# SFProgressCircle

[![Build Status](https://travis-ci.org/sfcd/SFProgressCircle.svg?branch=master)](https://travis-ci.org/sfcd/SFProgressCircle)
![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)
[![Twitter](https://img.shields.io/badge/twitter-SFCD-orange.svg)](https://twitter.com/sfcdteam)

A circular gradient progress view implementation for iOS with efficient drawing using a series of arcs with linear gradient.

<img src="https://raw.githubusercontent.com/sfcd/SFProgressCircle/master/Example/Resources/scr.png" alt="Example Usage" width="320" height="569" />
<img src="https://raw.githubusercontent.com/sfcd/SFProgressCircle/master/Example/Resources/example.gif" alt="Example Usage" width="320" height="569" />

## Features

- [x] Perfect circular gradient.
- [x] Possibility to set both ``startColor`` and ``endColor``.
- [x] Possibility to set both ``startAngle`` and ``endAngle``.
- [x] Possibility to set ``lineWidth``.
- [x] Possibility to set ``progress`` with or without animation.

## TODO

- [ ] Looped circular gradient.
- [ ] Rounded edges for progress line.
- [ ] Multiple colors for gradient.

## Requirements

- iOS 8.0+
- Xcode 6.3+

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

## Contribution

Please feel free to ask questions, open issues and submit pull requests.

## License

SFProgressCircle is available under the MIT license. See the LICENSE file for more info.

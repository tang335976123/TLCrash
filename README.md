# TLCrash

[![CI Status](https://img.shields.io/travis/TLCrash/TLCrash.svg?style=flat)](https://travis-ci.org/TLCrash/TLCrash)
[![Version](https://img.shields.io/cocoapods/v/TLCrash.svg?style=flat)](https://cocoapods.org/pods/TLCrash)
[![License](https://img.shields.io/cocoapods/l/TLCrash.svg?style=flat)](https://cocoapods.org/pods/TLCrash)
[![Platform](https://img.shields.io/cocoapods/p/TLCrash.svg?style=flat)](https://cocoapods.org/pods/TLCrash)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TLCrash is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TLCrash'
```

## Author

TLCrash, 857258218@qq.com

## License

TLCrash is available under the MIT license. See the LICENSE file for more info.

# Crash收集
## 调用方法
#### 把这个+(void)collectCrash 直接放入 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 这个方法中调用就可以了。

目制存放路经 [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]; 
 NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
 
 #### https://github.com/TLCrash/TLCrash.git
 ######  https://github.com/tang335976123/TLCrash.git
 


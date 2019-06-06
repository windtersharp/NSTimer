
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/WTTimer.svg)](https://img.shields.io/cocoapods/v/WTTimer.svg)

## This library provides a category for NSTimer. You don't need to invoke the invalidate method in timer manually, which can avoid  memory leak that caused by circular reference.

## Installation

NSTimer supports CocoaPods for installing the library in a project.

#### Podfile

To integrate NSTimer into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
target 'TargetName' do
  pod 'WTTimer'         
end
```


Then, run the following command:

```bash
$ pod install
```


## Usage

It is the same as the system native method, and you don't need to invoke the invalidate method in timer manually,

``` objc
   
NSTimer  *timer = [NSTimer wt_scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(log) userInfo:nil repeats:YES];
[timer invalidate]; // Not necessary

```



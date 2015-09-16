# HaidoraAlertViewManager

[![Version](https://img.shields.io/cocoapods/v/HaidoraAlertViewManager.svg?style=flat)](http://cocoapods.org/pods/HaidoraAlertViewManager)
[![License](https://img.shields.io/cocoapods/l/HaidoraAlertViewManager.svg?style=flat)](http://cocoapods.org/pods/HaidoraAlertViewManager)
[![Platform](https://img.shields.io/cocoapods/p/HaidoraAlertViewManager.svg?style=flat)](http://cocoapods.org/pods/HaidoraAlertViewManager)

## Usage

统一弹出框API.

使用如下

```objc
//弹出message
+ (void)alertWithMessage:(NSString *)message;
//弹出title和message
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message;
//弹出title、message、cancelTitle
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           cancelTitle:(NSString *)cancelTitle;
//弹出title、message和多个按钮
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           clickAction:(void (^)(id alertView, NSInteger index))clickAction
           cancelTitle:(NSString *)cancelTitle
     otherButtonTitles:(NSString *)buttonTitle, ... NS_REQUIRES_NIL_TERMINATION;
//弹出error
+ (void)alertWithError:(NSError *)error;
```
自定义弹出框样式

```objc
//1.实现HaidoraAlertViewProtocol
@interface XXXAlertView <HaidoraAlertViewProtocol>

@end
//2.配置弹出框
[HDAlertViewManager setAlertViewClass:[XXXAlertView class]];
```

## Installation

HaidoraAlertViewManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HaidoraAlertViewManager"
```

## Author

liaowei, 598951856@qq.com

## License

HaidoraAlertViewManager is available under the MIT license. See the LICENSE file for more info.

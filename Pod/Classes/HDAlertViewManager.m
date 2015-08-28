//
//  HDAlertViewManager.m
//  Pods
//
//  Created by guakeliao on 15/8/27.
//
//

#import "HDAlertViewManager.h"
#import <objc/runtime.h>

static Class<HaidoraAlertViewProtocol> _alertViewClass = nil;

@implementation HDAlertViewManager

+ (void)setAlertViewClass:(Class<HaidoraAlertViewProtocol>)alertViewClass;
{
    Class tempClass = alertViewClass;
    if ([[[tempClass alloc] init] conformsToProtocol:@protocol(HaidoraAlertViewProtocol)])
    {
        _alertViewClass = alertViewClass;
    }
    else
    {
        NSAssert(NO, @"%@ must conforms to %@", NSStringFromClass(tempClass),
                 NSStringFromProtocol(@protocol(HaidoraAlertViewProtocol)));
    }
}

+ (void)alertWithMessage:(NSString *)message
{
    [_alertViewClass alertWithMessage:message];
}

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message
{
    [_alertViewClass alertWithTitle:title message:message];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           cancelTitle:(NSString *)cancelTitle
{
    [_alertViewClass alertWithTitle:title message:message cancelTitle:cancelTitle];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           clickAction:(void (^)(id alertView, NSInteger index))clickAction
           cancelTitle:(NSString *)cancelTitle
     otherButtonTitles:(NSString *)buttonTitle, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list arguments;
    id eachObject;
    NSMutableArray *buttonTitles = [NSMutableArray array];
    if (buttonTitle)
    {
        va_start(arguments, buttonTitle);

        while ((eachObject = va_arg(arguments, id)))
        {
            [buttonTitles addObject:eachObject];
        }
        va_end(arguments);
    }
    [_alertViewClass alertWithTitle:title
                            message:message
                        clickAction:clickAction
                        cancelTitle:cancelTitle
                  otherButtonTitles:buttonTitles];
}

+ (void)alertWithError:(NSError *)error
{
    [_alertViewClass alertWithError:error];
}

@end

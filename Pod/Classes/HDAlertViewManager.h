//
//  HDAlertViewManager.h
//  Pods
//
//  Created by guakeliao on 15/8/27.
//
//

#import <Foundation/Foundation.h>
#import "HaidoraAlertViewProtocol.h"

@interface HDAlertViewManager : NSObject

+ (void)alertWithMessage:(NSString *)message;

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message;

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           cancelTitle:(NSString *)cancelTitle;

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           clickAction:(void (^)(id alertView, NSInteger index))clickAction
           cancelTitle:(NSString *)cancelTitle
     otherButtonTitles:(NSString *)buttonTitle, ... NS_REQUIRES_NIL_TERMINATION;

+ (void)alertWithError:(NSError *)error;

// config
+ (void)setAlertViewClass:(Class<HaidoraAlertViewProtocol>)alertViewClass;

@end

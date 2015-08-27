//
//  HaidoraAlertViewProtocol.h
//  Pods
//
//  Created by guakeliao on 15/8/27.
//
//

#ifndef Pods_HaidoraAlertViewProtocol_h
#define Pods_HaidoraAlertViewProtocol_h

@protocol HaidoraAlertViewProtocol <NSObject>

+ (void)alertWithMessage:(NSString *)message;

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message;

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           cancelTitle:(NSString *)cancelTitle;

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           clickAction:(void (^)(id alertView, NSInteger index))clickAction
           cancelTitle:(NSString *)cancelTitle
     otherButtonTitles:(NSMutableArray *)buttonTitles;

+ (void)alertWithError:(NSError *)error;

@end

#endif

//
//  UIAlertView+HDAlertViewManager.m
//  Pods
//
//  Created by guakeliao on 15/8/27.
//
//

#import "UIAlertView+HDAlertViewManager.h"
#import "NSError+HDAlertViewManager.h"
#import "HDAlertViewManager.h"
#import <objc/runtime.h>

@implementation UIAlertView (HDAlertViewManager)

+ (void)load
{
    [HDAlertViewManager setAlertViewClass:[self class]];
}

+ (void)alertWithError:(NSError *)error
{
    if (error.hd_title != nil && error.hd_message != nil)
    {
        [UIAlertView alertWithTitle:error.hd_title message:error.hd_message];
    }
    else
    {
        [UIAlertView alertWithTitle:error.domain message:error.description];
    }
}

+ (void)alertWithMessage:(NSString *)message
{
    [UIAlertView alertWithTitle:NSLocalizedString(@"title", nil) message:message];
}

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message
{
    [UIAlertView alertWithTitle:title
                        message:message
                    cancelTitle:NSLocalizedString(@"cancel", nil)];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           cancelTitle:(NSString *)cancelTitle
{
    [UIAlertView alertWithTitle:title
                        message:message
                    clickAction:nil
                    cancelTitle:cancelTitle
              otherButtonTitles:nil];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
           clickAction:(void (^)(id alertView, NSInteger index))clickAction
           cancelTitle:(NSString *)cancelTitle
     otherButtonTitles:(NSMutableArray *)buttonTitles
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:cancelTitle
                                              otherButtonTitles:nil];
    [buttonTitles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      [alertView addButtonWithTitle:obj];
    }];
    alertView.clickAction = clickAction;
    alertView.delegate = alertView;
    [alertView show];
}

#pragma mark
#pragma mark Setter/Getter

- (void)setClickAction:(void (^)(UIAlertView *, NSInteger))clickAction
{
    objc_setAssociatedObject(self, &kHab_clickAction, clickAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIAlertView *, NSInteger))clickAction
{
    return objc_getAssociatedObject(self, &kHab_clickAction);
}

#pragma mark
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clickAction)
    {
        self.clickAction(alertView, buttonIndex);
    }
}

@end

//
//  NSError+HDAlertViewManager.m
//  Pods
//
//  Created by guakeliao on 15/8/27.
//
//

#import "NSError+HDAlertViewManager.h"
#import <objc/runtime.h>

@implementation NSError (HDAlertViewManager)

@dynamic hd_title;
@dynamic hd_message;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message
{
    NSError *error = [self initWithDomain:@"HDAlertViewManagerDomain" code:-1 userInfo:nil];
    error.hd_title = title;
    error.hd_message = message;
    return error;
}

- (void)setHd_title:(NSString *)hd_title
{
    objc_setAssociatedObject(self, &kHD_NSError_title, hd_title, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setHd_message:(NSString *)hd_message
{
    objc_setAssociatedObject(self, &kHD_NSError_message, hd_message,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)hd_title
{
    return objc_getAssociatedObject(self, &kHD_NSError_title);
}

- (NSString *)hd_message
{
    return objc_getAssociatedObject(self, &kHD_NSError_message);
}

@end

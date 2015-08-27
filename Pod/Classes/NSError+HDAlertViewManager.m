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

- (instancetype)init:(NSString *)title message:(NSString *)message
{
    NSError *error = [self initWithDomain:@"HDAlertViewManagerDomain" code:-1 userInfo:nil];
    error.hd_title = title;
    error.hd_message = message;
    return error;
}

- (void)setTitle:(NSString *)title
{
    objc_setAssociatedObject(self, &kHD_NSError_title, title, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setMessage:(NSString *)message
{
    objc_setAssociatedObject(self, &kHD_NSError_message, message, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)title
{
    return objc_getAssociatedObject(self, &kHD_NSError_title);
}

- (NSString *)message
{
    return objc_getAssociatedObject(self, &kHD_NSError_message);
}

@end

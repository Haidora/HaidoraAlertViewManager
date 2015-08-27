//
//  NSError+HDAlertViewManager.h
//  Pods
//
//  Created by guakeliao on 15/8/27.
//
//

static NSString *kHD_NSError_title = @"kHD_NSError_title";
static NSString *kHD_NSError_message = @"kHD_NSError_message";

#import <Foundation/Foundation.h>

@interface NSError (HDAlertViewManager)

@property (nonatomic, strong) NSString *hd_title;
@property (nonatomic, strong) NSString *hd_message;

- (instancetype)init:(NSString *)title message:(NSString *)message;

@end
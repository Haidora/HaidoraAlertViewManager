//
//  UIAlertView+HDAlertViewManager.h
//  Pods
//
//  Created by guakeliao on 15/8/27.
//
//

#import <UIKit/UIKit.h>
#import "HaidoraAlertViewProtocol.h"

static NSString *kHab_clickAction = @"kHab_clickAction";

@interface UIAlertView (HDAlertViewManager) <HaidoraAlertViewProtocol>

@end

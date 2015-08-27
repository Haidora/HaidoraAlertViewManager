//
//  HDViewController.m
//  HaidoraAlertViewManager
//
//  Created by liaowei on 08/27/2015.
//  Copyright (c) 2015 liaowei. All rights reserved.
//

#import "HDViewController.h"
#import <HaidoraAlertViewManager.h>
@interface HDViewController ()

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [HDAlertViewManager alertWithTitle:@"Tips"
                               message:@"message"
                           clickAction:^(id alertView, NSInteger index) {
                             // do something
                           }
                           cancelTitle:@"cancel"
                     otherButtonTitles:@"sure", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

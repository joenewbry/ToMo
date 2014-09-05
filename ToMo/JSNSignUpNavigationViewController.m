//
//  JSNSignUpNavigationViewController.m
//  Tomo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNSignUpNavigationViewController.h"

@interface JSNSignUpNavigationViewController ()

@end

@implementation JSNSignUpNavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // configure naivation bar to be translucent
    
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
}

@end

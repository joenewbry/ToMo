//
//  JSNManagementViewController.m
//  Tomo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNManagementViewController.h"

@interface JSNManagementViewController ()
@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UIView *signUpView;
@end

@implementation JSNManagementViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissSignUpView) name:@"JSNDismissSignUpView" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSignUpView) name:@"JSNShowSignUpView" object:nil];
}

- (void)dismissSignUpView
{
    
    // staggered
    [UIView animateWithDuration:.8 animations:^{
        self.signUpView.alpha = 0.0;
    }];
    
    [UIView animateWithDuration:.4 animations:^{
        self.shadowView.alpha = 0.0;
    }];
}

- (void)showSignUpView
{
    [UIView animateWithDuration:.8 animations:^{
        self.signUpView.alpha = 1.0;
    }];
    
    [UIView animateWithDuration:.4 animations:^{
        self.shadowView.alpha = 0.9;
    }];
}

@end

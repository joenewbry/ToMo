//
//  JSNProductViewController.m
//  Tomo
//
//  Created by Joe Newbry on 9/5/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNProductViewController.h"

@interface JSNProductViewController ()
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation JSNProductViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.signUpButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (IBAction)didPressSignUp:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}


@end

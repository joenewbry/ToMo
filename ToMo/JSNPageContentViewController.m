//
//  JSNPageContentViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNPageContentViewController.h"

@interface JSNPageContentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation JSNPageContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.taglineLabel.text = self.titleText;
    self.contentLabel.text = self.descriptionText;
    
    // only show sign up button on last page
    //if (self.pageIndex == 2) self.signUpButton.hidden = NO;
    //if (self.pageIndex != 2) self.signUpButton.hidden = YES;
    
    [self.view setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)didPressSignUp:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

@end

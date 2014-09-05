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
@property (weak, nonatomic) IBOutlet UIImageView *walkthroughImage;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation JSNPageContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.taglineLabel.text = self.titleText;
    self.walkthroughImage.image = [UIImage imageNamed:self.imageFile];
    self.signUpButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    // only show sign up button on last page
    if (self.pageIndex == 2) self.signUpButton.hidden = NO;
    if (self.pageIndex != 2) self.signUpButton.hidden = YES;
}

- (IBAction)didPressSignUp:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

@end

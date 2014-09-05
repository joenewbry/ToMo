//
//  JSNViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNViewController.h"
#import "JSNEmailLoginOrSignUpViewController.h"

@interface JSNViewController ()
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
@property (weak, nonatomic) IBOutlet UIButton *lookAroundButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *logInOrSignUpButton;

@property BOOL isLogIn;

@end

@implementation JSNViewController


#pragma mark - View Lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    _isLogIn = true;
    
    self.lookAroundButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destinationViewController = [segue destinationViewController];
    
    // configure EmailLoginOrSignUpViewController
    if ([destinationViewController isKindOfClass:[JSNEmailLoginOrSignUpViewController class]]) {
        JSNEmailLoginOrSignUpViewController *emailLoginOrSignUpViewController = (JSNEmailLoginOrSignUpViewController *)destinationViewController;
        emailLoginOrSignUpViewController.submitButtonTitleText = @"Join Us";
    }
    
    // display nav bar (hidden by default)
    //[self.navigationController setNavigationBarHidden:NO animated:NO];
}


#pragma mark - User input

- (IBAction)didPressLookAround:(id)sender {
    [self.activityIndicator stopAnimating];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNDismissSignUpView" object:self];
}
- (IBAction)didPressSignUpWithFacebook:(id)sender {

    
    [self.activityIndicator startAnimating];
    [self performSelector:@selector(didPressLookAround:) withObject:nil afterDelay:2.0];
}


- (IBAction)didPressLogInOrSignUp:(id)sender {
    //self.logInOrSignUpButton.enabled = false;
    
    if (self.isLogIn) {
        [self.facebookButton setTitle:@"Log in with Facebook" forState:UIControlStateNormal];
        [self.emailButton setTitle:@"Log in with Email" forState:UIControlStateNormal];
        [self.logInOrSignUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    } else {
        [self.facebookButton setTitle:@"Sign up with Facebook" forState:UIControlStateNormal];
        [self.emailButton setTitle:@"Sign up with Email" forState:UIControlStateNormal];
        [self.logInOrSignUpButton setTitle:@"Log In" forState:UIControlStateNormal];
    }
    
//    [self.facebookButton setNeedsLayout];
//    [self.emailButton setNeedsLayout];
//    [self.logInOrSignUpButton setNeedsLayout];
    
    //[self performSelector:@selector(enableLogInOrSignUp) withObject:self afterDelay:5.0];
    
    self.isLogIn = !self.isLogIn;
}

#pragma mark - Private methods

- (void)enableLogInOrSignUp
{
    
    if (self.isLogIn) self.logInOrSignUpButton.titleLabel.text = @"Sign Up";
    if (!self.isLogIn) self.logInOrSignUpButton.titleLabel.text = @"Log In";
    
    
    
}

@end

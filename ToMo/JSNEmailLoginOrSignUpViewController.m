//
//  JSNEmailLoginOrSignUpViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNEmailLoginOrSignUpViewController.h"

@interface JSNEmailLoginOrSignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation JSNEmailLoginOrSignUpViewController


#pragma mark - Lifecyle methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /* from stack overflow (http://stackoverflow.com/questions/7565645/indent-the-text-in-a-uitextfield) **/
    
    CGFloat cornerRadius = 6.0;
    
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _emailTextField.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    _emailTextField.layer.borderWidth = 1.0;
    [_emailTextField setLeftViewMode:UITextFieldViewModeAlways];
    [_emailTextField setLeftView:spacerView];
    _emailTextField.layer.cornerRadius = cornerRadius;
    
    
    UIView *passwordSpacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _passwordTextField.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    _passwordTextField.layer.borderWidth = 1.0;
    [_passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
    [_passwordTextField setLeftView:passwordSpacerView];
    _passwordTextField.layer.cornerRadius = cornerRadius;

    _submitButton.layer.cornerRadius = cornerRadius;
    
}

#pragma mark - User Input

- (IBAction)didPressSubmitButton:(id)sender {
    [self.activityIndicator startAnimating];
    
    [self performSelector:@selector(didPressSubmit) withObject:nil afterDelay:2.0];
}


#pragma mark - Private methods

- (void)didPressSubmit
{
    [self.navigationController popToRootViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNDismissSignUpView" object:self];
}

@end

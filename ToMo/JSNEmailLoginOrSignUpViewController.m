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
    _emailTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _emailTextField.layer.borderWidth = 1.0;
    [_emailTextField setLeftViewMode:UITextFieldViewModeAlways];
    [_emailTextField setLeftView:spacerView];
    _emailTextField.layer.cornerRadius = cornerRadius;
    [self setPlaceholderText:@"Email" andTextField:_emailTextField withColor:[UIColor whiteColor]];
    _emailTextField.delegate = self;

    
    UIView *passwordSpacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _passwordTextField.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    _passwordTextField.layer.borderWidth = 1.0;
    [_passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
    [_passwordTextField setLeftView:passwordSpacerView];
    _passwordTextField.layer.cornerRadius = cornerRadius;
    [self setPlaceholderText:@"Password" andTextField:_passwordTextField withColor:[UIColor whiteColor]];
    _passwordTextField.delegate = self;

    _submitButton.layer.cornerRadius = cornerRadius;
}

#pragma mark - User Input

- (IBAction)didPressSubmitButton:(id)sender {
    [self.activityIndicator startAnimating];
    
    [self performSelector:@selector(didPressSubmit) withObject:nil afterDelay:0.5];
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // if user inputs password first this won't work
    if ([textField isEqual:self.emailTextField]) {
        [textField resignFirstResponder];
        [self.passwordTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self didPressSubmitButton:self];
    }
    return YES;
}


#pragma mark - Private methods

- (void)didPressSubmit
{
    [self.navigationController popToRootViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNDismissSignUpView" object:self];
}

- (void)setPlaceholderText:(NSString *)text andTextField:(UITextField *)textField withColor:(UIColor *)color
{
    if ([textField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
    }
}

@end

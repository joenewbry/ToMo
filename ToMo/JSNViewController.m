//
//  JSNViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNViewController.h"
#import "JSNEmailLoginOrSignUpViewController.h"
#import "JSNSignInView.h"

@interface JSNViewController ()
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (strong, nonatomic) JSNSignInView *signInView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UITextField *passwordField;
@property (strong, nonatomic) UITextField *emailField;


@property BOOL isLogIn; // keep track of if user wants to sign up or log in
                        // could move this into a model class

@end

@implementation JSNViewController


#pragma mark - View Lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.signUpButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.signUpButton.layer.borderWidth = 1.0;
    
    self.signInButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.signInButton.layer.borderWidth = 1.0;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    _isLogIn = true;
    
    
    // configure scroll view to hold sign up and log in views (both need to scroll to accomodate the keyboard)
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [_scrollView setHidden:YES];
    [self.view addSubview:_scrollView];
    
    _signInView = [[JSNSignInView alloc] init];
    UIButton *signInButton = (UIButton *)[_signInView viewWithTag:3]; // sign in button
    [signInButton addTarget:self action:@selector(didPressSignIntoToMo:) forControlEvents:UIControlEventTouchUpInside];
    [_signInView setFrame:CGRectMake(0.0f, [UIScreen mainScreen].bounds.size.height - _signInView.frame.size.height, _signInView.frame.size.width, _signInView.frame.size.height)];
    [self.scrollView addSubview:_signInView];
    [_signInView setHidden:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - User input


- (IBAction)didPressSignUpWithFacebook:(id)sender {

    [self.activityIndicator startAnimating];
    
    [self performSelector:@selector(hideSignUp) withObject:nil afterDelay:.5];
}

- (IBAction)didPressSignIn:(id)sender {
    [self.scrollView setHidden:NO];
    [self.signInView setHidden:NO];
    
    self.emailField = (UITextField *)[self.signInView viewWithTag:1]; // email text field
    self.emailField.delegate = self;
    
    self.passwordField = (UITextField *)[self.signInView viewWithTag:2]; // password text field
    self.passwordField.delegate = self;
}

- (void)didPressSignIntoToMo:(JSNSignInView *)sender
{
    [self.view endEditing:YES]; // to dismiss keyboard
    [self.signInView setHidden:YES];
    [self.scrollView setHidden:YES];
    
    self.passwordField = nil; // don't need to keep track of password and email fields
    self.emailField = nil;
    
    [self hideSignUp];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.emailField]) {
        [self.passwordField becomeFirstResponder];
    } else {
        [self.emailField becomeFirstResponder];
    }
    return YES;
}

#pragma mark - private methods

- (void)hideSignUp
{
    [self.activityIndicator stopAnimating];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNDismissSignUpView" object:self userInfo:nil];
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    [self.scrollView setContentOffset:CGPointMake(0, 216) animated:YES];
}

- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [self.scrollView setContentOffset:CGPointZero];
}



@end

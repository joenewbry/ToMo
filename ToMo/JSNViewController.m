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
@property (strong, nonatomic) JSNSignInView *signUpView;
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
    
    // create sign in view and add to scroll view
    _signInView = [[JSNSignInView alloc] initWithButtonTitle:@"SIGN IN" andPasswordReset:YES];
    UIButton *signInButton = (UIButton *)[_signInView viewWithTag:3]; // sign in button
    [signInButton addTarget:self action:@selector(didPressSignIntoToMo:) forControlEvents:UIControlEventTouchUpInside];
    [_signInView setFrame:CGRectMake(0.0f, [UIScreen mainScreen].bounds.size.height - _signInView.frame.size.height, _signInView.frame.size.width, _signInView.frame.size.height)];
    [self.scrollView addSubview:_signInView];
    [_signInView setHidden:YES];
    
    // create sign up view, hide it and add to scroll view
    _signUpView = [[JSNSignInView alloc] initWithButtonTitle:@"SIGN UP" andPasswordReset:NO];
    UIButton *signUpButton = (UIButton *)[_signUpView viewWithTag:3];
    [signUpButton addTarget:self action:@selector(didPressSignUpIntoToMo:) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView setFrame:CGRectMake(0.0f, [UIScreen mainScreen].bounds.size.height - _signUpView.frame.size.height, _signUpView.frame.size.width, _signUpView.frame.size.height)];
    [self.scrollView addSubview:_signUpView];
    
    // listen for keyboard notifications to adjust sign up or sign in view
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView:)];
    [self.view addGestureRecognizer:tap];
}

#pragma mark - User input


- (IBAction)didPressSignUpWithFacebook:(id)sender {

    [self.activityIndicator startAnimating];
    
    [self performSelector:@selector(hideSignUp) withObject:nil afterDelay:.5];
}


- (IBAction)didPressSignIn:(id)sender
{
    [self.scrollView setHidden:NO];
    [self.signInView setHidden:NO];
    
    [self storeEmailAndPasswordFieldsOnView:self.signInView];
}

- (IBAction)didPressSignUp:(id)sender
{
    [self.scrollView setHidden:NO];
    [self.signUpView setHidden:NO];
    
    // store current email and password fields for login / sign up use
    [self storeEmailAndPasswordFieldsOnView:self.signUpView];
}

- (void)didPressSignIntoToMo:(JSNSignInView *)sender
{
    [self.view endEditing:YES]; // to dismiss keyboard
    [self.signInView setHidden:YES];
    [self.scrollView setHidden:YES];
    
    [self resetTextFields];
    [self hideSignUp];
}

- (void)didPressSignUpIntoToMo:(JSNSignInView *)sender
{
    [self.view endEditing:YES];
    [self.signUpView setHidden:YES];
    [self.scrollView setHidden:YES];
    
    [self resetTextFields];
    [self hideSignUp];
}

// if view is tapped dismiss keyboard
- (void)didTapView:(id)sender
{
    [self.signInView setHidden:YES];
    [self.signUpView setHidden:YES];
    [self.scrollView setHidden:YES];
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // check if both fields field, else switch to the other field
    if (self.emailField.text.length > 0 && self.passwordField.text.length > 0)
    {
        [self didPressSignIntoToMo:nil];
    }
    else if ([textField isEqual:self.emailField]) {
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

- (void)resetTextFields
{
    self.passwordField.text = @"";
    self.passwordField = nil;
    
    self.emailField.text = @"";
    self.emailField = nil;
}

- (void)storeEmailAndPasswordFieldsOnView:(UIView *)view
{
    self.emailField = (UITextField *)[view viewWithTag:1]; // email text field
    self.emailField.delegate = self;
    
    self.passwordField = (UITextField *)[view viewWithTag:2]; // password text field
    self.passwordField.delegate = self;
}



@end

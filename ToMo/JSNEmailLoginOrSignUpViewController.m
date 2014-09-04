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

@end

@implementation JSNEmailLoginOrSignUpViewController

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
    
    
    /* from stack overflow (http://stackoverflow.com/questions/7565645/indent-the-text-in-a-uitextfield) **/
    
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _emailTextField.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    _emailTextField.layer.borderWidth = 1.0;
    [_emailTextField setLeftViewMode:UITextFieldViewModeAlways];
    [_emailTextField setLeftView:spacerView];
    
    
    UIView *passwordSpacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _passwordTextField.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    _passwordTextField.layer.borderWidth = 1.0;
    [_passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
    [_passwordTextField setLeftView:passwordSpacerView];
    
    _submitButton.titleLabel.text = _submitButtonTitleText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didPressSubmitButton:(id)sender {
    NSLog(@"Dismiss the whole signin flow on succesful signup/login or else display error message");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

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
@property (weak, nonatomic) IBOutlet UIButton *lookAroundButton;

@end

@implementation JSNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    self.lookAroundButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressLookAround:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNDismissSignUpView" object:self];
}
- (IBAction)didPressSignUpWithFacebook:(id)sender {
    
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

@end

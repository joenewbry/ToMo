//
//  JSNWebViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNWebViewController.h"

@interface JSNWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation JSNWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.touchofmodern.com/terms"]]];
    
    self.webView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blackColor]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    
    [webView.scrollView setContentOffset:CGPointMake(0.0f, 44.0f)];
}



@end

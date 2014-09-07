//
//  JSNSignInView.m
//  ToMo
//
//  Created by Joe Newbry on 9/7/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNSignInView.h"

@implementation JSNSignInView

- (id)initWithButtonTitle:(NSString *)title andPasswordReset:(BOOL)hasReset
{
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"JSNSignInView" owner:self options:nil];
    id mainView = [subviewArray objectAtIndex:0];
    
    UIButton *passwordResetButton = (UIButton *)[mainView viewWithTag:4];
    passwordResetButton.hidden = !hasReset;
    
    UIButton *signInOrSignUp = (UIButton *)[mainView viewWithTag:3];
    [signInOrSignUp setTitle:title forState:UIControlStateNormal];
    
    return mainView;
}

@end

//
//  JSNSignInView.m
//  ToMo
//
//  Created by Joe Newbry on 9/7/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNSignInView.h"

@implementation JSNSignInView

- (id)init
{
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"JSNSignInView" owner:self options:nil];
    id mainView = [subviewArray objectAtIndex:0];
    
    return mainView;
}

@end

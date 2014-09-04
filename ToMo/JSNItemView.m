//
//  JSNItemTableViewCell.m
//  ToMo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNItemView.h"

@interface JSNItemView ()

@end

@implementation JSNItemView

- (id)init
{
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"JSNItemView" owner:self options:nil];
    id mainView = [subviewArray objectAtIndex:0];
    
    return mainView;
}

@end

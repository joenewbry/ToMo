//
//  JSNItemTableViewCell.m
//  ToMo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNItemView.h"
#import <QuartzCore/QuartzCore.h>

@interface JSNItemView ()

@property (weak, nonatomic) IBOutlet UIView *gradientView;

@end

@implementation JSNItemView
@synthesize gradientView;
@synthesize itemImageView;

- (id)init
{
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"JSNItemView" owner:self options:nil];
    id mainView = [subviewArray objectAtIndex:0];
    
    
    return mainView;
}

- (void)awakeFromNib
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = itemImageView.frame;
    gradient.colors = @[(id)[[UIColor clearColor] CGColor],
                        (id)[[UIColor blackColor] CGColor]];
    [itemImageView.layer insertSublayer:gradient atIndex:0];
}


@end

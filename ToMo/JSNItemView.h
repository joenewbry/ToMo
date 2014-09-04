//
//  JSNItemTableViewCell.h
//  ToMo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSNItemView : UIView

@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

- (id)init;

@end

//
//  JSNItemTableViewCell.h
//  ToMo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSNItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

- (id)initWithImage:(UIImage *)image;
- (id)initWithImage:(UIImage *)image andTitle:(NSString *)title andPrice:(NSNumber *)price;

@end

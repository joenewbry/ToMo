//
//  JSNProductScrollViewController.h
//  ToMo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SwipeView/SwipeView.h> // should be prefixed

@interface JSNProductScrollViewController : UIViewController <SwipeViewDataSource, SwipeViewDelegate>
@property (weak, nonatomic) IBOutlet SwipeView *scrollingItemView;

@end
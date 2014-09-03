//
//  JSNPageViewController.h
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSNPageContentViewController.h"

@interface JSNPageViewController : UIPageViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end

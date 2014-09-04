//
//  JSNProductScrollViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/4/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNProductScrollViewController.h"
#import "JSNProductDataSource.h"
#import "JSNItemView.h"

@interface JSNProductScrollViewController ()

@property (strong, nonatomic) JSNProductDataSource *dataSource;

@end

@implementation JSNProductScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
    // set up data source
    _dataSource = [[JSNProductDataSource alloc] init];
    
    // configure scrolling view
    _scrollingItemView.alignment = SwipeViewAlignmentCenter;
    _scrollingItemView.pagingEnabled = NO;
    _scrollingItemView.vertical = YES;
    //_scrollingItemView.itemsPerPage = 2.5;
    _scrollingItemView.wrapEnabled = YES;
    _scrollingItemView.truncateFinalPage = YES;
    
    _scrollingItemView.dataSource = self;
    _scrollingItemView.delegate = self;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.scrollingItemView.autoscroll = -0.2;
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return [self.dataSource numberOfItems];
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[JSNItemView alloc] init];
    }
    
    JSNItemView *itemView = (JSNItemView *)view;
    
    itemView.itemImageView.image = [self.dataSource imageForItemAtIndex:(NSUInteger)index];
    
    return itemView;
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return CGSizeMake(320, 220);
}



@end

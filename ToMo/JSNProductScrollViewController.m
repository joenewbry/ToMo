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
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property BOOL isSignUp;

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
    _scrollingItemView.truncateFinalPage = YES;
    _scrollingItemView.defersItemViewLoading = YES; // smooths out scroll animation (may lead to gaps)
    
    _scrollingItemView.dataSource = self;
    _scrollingItemView.delegate = self;
    
    _isSignUp = true;
    
    [self startScrolling];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissSignUpView) name:@"JSNDismissSignUpView" object:nil];
}

- (void)dismissSignUpView
{
    _isSignUp = false;
    [self reloadVisibleItems];
    
    [self stopScrolling];
    self.backButton.hidden = false;
    
}

- (void)showSignUpView
{
    [self startScrolling];
}

- (void)startScrolling
{
    self.scrollingItemView.autoscroll = -0.2;
    self.scrollingItemView.wrapEnabled = YES;

}

- (void)stopScrolling
{
    self.scrollingItemView.autoscroll = 0.0;
    self.scrollingItemView.wrapEnabled = NO;

}

- (void)viewWillAppear:(BOOL)animated
{
    [self startScrolling];
}
- (IBAction)didPressBack:(id)sender {
    
    // display of scrolling item view dependent on isSignUp
    _isSignUp = true;
    
    // always three visible items on screen
    
    [self reloadVisibleItems];

    [self startScrolling];
    
    
    self.backButton.hidden = true;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNShowSignUpView" object:nil];
}

- (void)reloadVisibleItems
{
    NSInteger firstItemIndex = [self.scrollingItemView.indexesForVisibleItems.firstObject integerValue];
    NSInteger secondItemIndex = [[self.scrollingItemView.indexesForVisibleItems objectAtIndex:1] integerValue];
    NSInteger thirdItemIndex = [self.scrollingItemView.indexesForVisibleItems.lastObject integerValue];
    
    
    [self.scrollingItemView reloadItemAtIndex:firstItemIndex];
    [self.scrollingItemView reloadItemAtIndex:secondItemIndex];    
    [self.scrollingItemView reloadItemAtIndex:thirdItemIndex];
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
    [itemView.itemDescriptionLabel setText:[self.dataSource nameForItemAtIndex:(NSUInteger)index]];
    itemView.itemDescriptionLabel.hidden = _isSignUp; // if sign up screen is displayed hide item description
    
    return itemView;
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return CGSizeMake(320, 220);
}



@end

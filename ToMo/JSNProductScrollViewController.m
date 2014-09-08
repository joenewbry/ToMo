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
#import <MediaPlayer/MediaPlayer.h>

@interface JSNProductScrollViewController ()

@property (strong, nonatomic) JSNProductDataSource *dataSource; // dummy data source
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *watchIntroButton;
@property MPMoviePlayerController *moviePlayer;

@property BOOL isSignUp; // keeps track of whether or not sign up view
                         // is being displayed on top of this view controller

@end

@implementation JSNProductScrollViewController

#pragma mark - Lifecyle methods

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
    
    
    // get notified when user logs in or signs up
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissSignUpView) name:@"JSNDismissSignUpView" object:nil];
    

    
}

- (void)moviePlayBackDidFinish:(id)sender
{
    [self.moviePlayer.view removeFromSuperview];

}



- (void)viewWillAppear:(BOOL)animated
{
    [self startScrolling];
}


#pragma mark - User Input

- (IBAction)didPressBack:(id)sender {
    
    // display of scrolling item view dependent on isSignUp
    _isSignUp = true;
    
    // always three visible items on screen
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    
    [self reloadVisibleItems];
    [self startScrolling];
    
    
    self.backButton.hidden = true;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNShowSignUpView" object:nil];
}

- (IBAction)didPressWatchIntro:(id)sender {
    // play movie
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Jimmy-20140907191321" ofType:@"mov"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    
    _moviePlayer =[[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [_moviePlayer prepareToPlay];
    [_moviePlayer.view setFrame:self.view.bounds];
    [_moviePlayer setRepeatMode:MPMovieRepeatModeOne];


    [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(moviePlayBackDidFinish:)
                                                     name:MPMoviePlayerPlaybackDidFinishNotification
                                                   object:_moviePlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinishWithReason:) name:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey object:_moviePlayer];
    
    _moviePlayer.controlStyle = MPMovieControlStyleDefault;
    _moviePlayer.shouldAutoplay = YES;
    [_moviePlayer setRepeatMode:MPMovieRepeatModeNone];
    [self.view addSubview:_moviePlayer.view];
    [_moviePlayer setFullscreen:YES animated:YES];
    [_moviePlayer play];
}

#pragma mark - Swipe View Data Source

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


#pragma mark -Swipe View Delegate

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return CGSizeMake(320, 220);
}


#pragma mark - Private Methods

- (void)dismissSignUpView
{
    _isSignUp = false;
    [self reloadVisibleItems];
    
    [self stopScrolling];
    self.backButton.hidden = false;
    self.watchIntroButton.hidden = false;
    
}

- (void)showSignUpView
{
    [self startScrolling];
}

- (void)startScrolling
{
    self.scrollingItemView.autoscroll = -0.2;
    self.scrollingItemView.wrapEnabled = YES;
    
    self.backButton.hidden = true; // hide back when scrolling
    self.watchIntroButton.hidden = true;

    
}

- (void)stopScrolling
{
    self.scrollingItemView.autoscroll = 0.0;
    self.scrollingItemView.wrapEnabled = YES;
    
    self.backButton.hidden = false; // show back button when not scrolling

    
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

@end

//
//  JSNSettingsViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/8/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNSettingsViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface JSNSettingsViewController ()
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@end

@implementation JSNSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)moviePlayBackDidFinish:(id)sender
{
    [self.moviePlayer.view removeFromSuperview];
}

- (IBAction)didPressWatchIntroVideo:(id)sender {
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

- (IBAction)didPressSignOut:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
    [self.navigationController setNavigationBarHidden:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNShowSignUpView" object:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

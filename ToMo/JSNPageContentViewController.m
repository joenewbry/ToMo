//
//  JSNPageContentViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNPageContentViewController.h"

@interface JSNPageContentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *walkthroughImage;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation JSNPageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.taglineLabel.text = self.titleText;
    self.walkthroughImage.image = [UIImage imageNamed:self.imageFile];
    self.signUpButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    if (self.pageIndex == 2) self.signUpButton.hidden = NO;
    if (self.pageIndex != 2) self.signUpButton.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

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

//
//  JSNPageViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNPageViewController.h"

@interface JSNPageViewController ()

@end

@implementation JSNPageViewController

#pragma mark - Lifecyle methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // should break out the model source into anouther class
    
    _pageDescriptions = @[@"Discover and be inspired by truely unique,  modern design. Anytime. Anywhere.", @"Browse both big name and independent designers that offers some of the most facinating forms you’ll see.", @"Shop premium designs not typically found in local retail outlets.  Modern design that’s affordable? Yep, you heard us right!"];
    _pageTitles = @[@"DISCOVER", @"BROWSE", @"SHOP"];
    
    self.dataSource = self;
    self.delegate = self;
    
    JSNPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


#pragma mark - UIPageViewControlDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((JSNPageContentViewController *) viewController).pageIndex;
    
    // scroll the view behind
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNScrollUp" object:self userInfo:nil];
    
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index --;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((JSNPageContentViewController *) viewController).pageIndex;

    // scroll the view behind
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JSNScrollDown" object:self userInfo:nil];

    
    if (index == NSNotFound) {
        return nil;
    }
    
    index ++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

#pragma mark - Private Methods

- (JSNPageContentViewController *)viewControllerAtIndex:(NSInteger)index {
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count]) ) {
        return nil;
    }
    
    // Create new JSNPageContentViewController with correct data
    JSNPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.descriptionText = self.pageDescriptions[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

@end

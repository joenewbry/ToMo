//
//  JSNHomePageViewController.m
//  ToMo
//
//  Created by Joe Newbry on 9/8/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNHomePageViewController.h"
#import "JSNProductDataSource.h"
#import "JSNItemView.h"

@interface JSNHomePageViewController ()

@property (strong, nonatomic) JSNProductDataSource *dataSource;

@end

@implementation JSNHomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static NSString* cellIdentifier = @"RegularCellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JSNItemView" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellIdentifier];
    
    _dataSource = [[JSNProductDataSource alloc] init];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(158, 106);
    [flowLayout setMinimumLineSpacing:4.0];
    [flowLayout setMinimumInteritemSpacing:4.0];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.collectionView.decelerationRate = 0.0;
    
    
    // get notified when user logs in or signs up
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissSignUpView) name:@"JSNDismissSignUpView" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollDown:) name:@"JSNScrollDown" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollUp:) name:@"JSNScrollUp" object:nil];
    

}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)dismissSignUpView
{
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

- (void)scrollDown:(NSNotification *)aNotification
{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] objectAtIndex:0];
    NSInteger row = currentIndexPath.row + 5 < [self.dataSource numberOfItems] ? currentIndexPath.row + 5 : [self.dataSource numberOfItems] - 1;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:row  inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

- (void)scrollUp:(NSNotification *)aNotification
{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] objectAtIndex:0];
    NSInteger row = currentIndexPath.row - 5 > 0 ? currentIndexPath.row - 5 : 0;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:row  inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataSource numberOfItems];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSNItemView *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.itemDescriptionLabel.text = [self.dataSource nameForItemAtIndex:indexPath.row];
    cell.itemImageView.image = [self.dataSource imageForItemAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - UICollection View Delegate


@end

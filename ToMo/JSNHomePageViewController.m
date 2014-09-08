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
    flowLayout.itemSize = CGSizeMake(158, 107);
    [flowLayout setMinimumLineSpacing:2.0];
    
    
    [self.collectionView setCollectionViewLayout:flowLayout];
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

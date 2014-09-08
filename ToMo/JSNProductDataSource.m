//
//  JSNProductDataSource.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNProductDataSource.h"



@interface JSNProductDataSource ()

@property (strong, nonatomic) NSArray *itemImages;
@property (strong, nonatomic) NSArray *itemNames;
@property (strong, nonatomic) NSArray *itemDescriptions;
@property (strong, nonatomic) NSArray *itemExpirations;

@end

@implementation JSNProductDataSource

- (id)init
{
    if (self == [super init]) {
        _itemNames = @[@"Del Ben", @"Agustav", @"The Forma", @"Garrett Leight Cali Optical", @"iconbit", @"Wassily Kandinsky", @"Novo Watches", @"SmartPlane"];
    }
    return self;
}

- (NSInteger)numberOfItems
{
    return [self.itemNames count] * 4;
}

- (UIImage *)imageForItemAtIndex:(NSUInteger)index sortedBy:(JSNProductSort)type
{
    NSString *itemName;
    NSString *imagePath;
    NSUInteger randIndex = (NSUInteger)arc4random() % 8;

    switch (type) {
        case JSNProductSortByNewest:
            itemName = [self.itemNames objectAtIndex:index % 8];
            imagePath = [itemName stringByAppendingString:@".jpg"];
        break;
            
        case JSNProductSortByPopular:
            itemName = [self.itemNames objectAtIndex:randIndex];
            imagePath = [itemName stringByAppendingString:@".jpg"];
        break;
            
        case JSNProductSortByTrending:
            itemName = [self.itemNames objectAtIndex:index];
            imagePath = [itemName stringByAppendingString:@".jpg"];
        break;
    }

    return [UIImage imageNamed:imagePath];
}

- (NSString *)nameForItemAtIndex:(NSUInteger)index sortedBy:(JSNProductSort)type
{
    return [self.itemNames objectAtIndex:index % 8];
}


- (NSString *)descriptionForItemAtIndex:(NSUInteger)index sortedBy:(JSNProductSort)type
{
    NSLog(@"Warning not implemented");
    return @"Default string";
}

- (NSDate *)expirationDateForItemAtIndex:(NSUInteger)index
{
    NSLog(@"Warning not implemented");
    return [NSDate dateWithTimeIntervalSinceNow:NSTimeIntervalSince1970];
}

@end

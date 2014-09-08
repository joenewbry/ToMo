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

- (UIImage *)imageForItemAtIndex:(NSUInteger)index
{
    NSString *itemName = [self.itemNames objectAtIndex:index % 8];
    NSString *imagePath = [itemName stringByAppendingString:@".jpg"];
    return [UIImage imageNamed:imagePath];
}

- (NSString *)nameForItemAtIndex:(NSUInteger)index
{
    return [self.itemNames objectAtIndex:index % 8];
}

- (NSString *)descriptionForItemAtIndex:(NSUInteger)index
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

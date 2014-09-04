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
        _itemNames = @[@"Keysmart", @"Tribal Steel", @"Del Ben", @"Agustav", @"The Forma", @"Garrett Leight Cali Optical", @"iconbit", @"Wassily Kandinsky", @"Novo Watches", @"SmartPlane"];
    }
    return self;
}

- (UIImage *)imageForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIImage imageNamed:@"Agustav.jpg"];
}

- (NSString *)nameForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.itemNames objectAtIndex:indexPath.row];
}

- (NSString *)descriptionForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Default string";
}

- (NSDate *)expirationDateForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [NSDate dateWithTimeIntervalSinceNow:NSTimeIntervalSince1970];
}

@end

//
//  JSNProductDataSource.h
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSNProductDataSource : NSObject

- (UIImage *)imageForItemAtIndex:(NSUInteger)index;
- (NSString *)nameForItemAtIndex:(NSUInteger)index;

- (NSInteger)numberOfItems;

/* not implemented */
- (NSString *)descriptionForItemAtIndex:(NSUInteger)index;
- (NSDate *)expirationDateForItemAtIndex:(NSUInteger)index;



@end

//
//  JSNProductDataSource.h
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSNProductDataSource : NSObject

- (UIImage *)imageForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)nameForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)descriptionForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSDate *)expirationDateForItemAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfItems;

@end

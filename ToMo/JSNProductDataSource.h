//
//  JSNProductDataSource.h
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JSNProductSort) {
    JSNProductSortByNewest,
    JSNProductSortByPopular,
    JSNProductSortByTrending
};

@interface JSNProductDataSource : NSObject

- (UIImage *)imageForItemAtIndex:(NSUInteger)index sortedBy:(JSNProductSort)type;
- (NSString *)nameForItemAtIndex:(NSUInteger)index sortedBy:(JSNProductSort)type;
;

- (NSInteger)numberOfItems;

/* not implemented */
- (NSString *)descriptionForItemAtIndex:(NSUInteger)index;
- (NSDate *)expirationDateForItemAtIndex:(NSUInteger)index;



@end

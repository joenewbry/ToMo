//
//  JSNPushNoAnimationSegue.m
//  ToMo
//
//  Created by Joe Newbry on 9/3/14.
//  Copyright (c) 2014 Joe Newbry. All rights reserved.
//

#import "JSNPushNoAnimationSegue.h"

@implementation JSNPushNoAnimationSegue

- (void) perform {
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end

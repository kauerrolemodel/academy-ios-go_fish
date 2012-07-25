//
//  NSMutableArray+Shuffling.m
//  GoFish
//
//  Created by Ken Auer on 7/24/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)

- (void)shuffle {
  NSUInteger count = [self count];
  for (NSUInteger i=0; i < count; i++) {
    NSUInteger countRemaining = count - i;
    NSUInteger randomIndex = arc4random() % countRemaining + i;
    [self exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
  }
}

@end

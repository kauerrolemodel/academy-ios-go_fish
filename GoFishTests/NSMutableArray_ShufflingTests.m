//
//  NSMutableArray_ShufflingTests.m
//  GoFish
//
//  Created by Ken Auer on 7/24/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "NSMutableArray_ShufflingTests.h"
#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray_ShufflingTests

- (void)testShuffle {
  NSArray *original = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", nil];
  NSMutableArray *array = [original mutableCopy];
  [array shuffle];
  STAssertEquals([array count], (NSUInteger)5, @"Should stay the same size");
  STAssertFalse([[NSArray arrayWithArray:array] isEqual:original], @"The order must be different");
}

@end

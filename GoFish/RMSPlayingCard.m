//
//  RMSPlayingCard.m
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSPlayingCard.h"

static NSArray *_ranks;
static NSArray *_suits;

@implementation RMSPlayingCard
@synthesize rank = _rank;
@synthesize suit = _suit;

+ (void)initialize {
  _ranks = [NSArray arrayWithObjects: @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A", nil];
  _suits = [NSArray arrayWithObjects: @"Clubs", @"Hearts", @"Diamonds", @"Spades", nil];
}

- (id)initWithRank: (NSString *)rank suit: (NSString *)suit {
  self = [super init];
  if (self) {
    _rank = rank;
    _suit = suit;
  }
  return self;
}

+ (NSArray *)ranks {
  return _ranks;
}

+ (NSArray *)suits {
  return _suits;
}

@end

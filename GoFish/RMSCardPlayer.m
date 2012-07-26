//
//  RMSCardPlayer.m
//  GoFish
//
//  Created by Ken Auer on 7/24/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSCardPlayer.h"

@interface RMSCardPlayer ()
@end


@implementation RMSCardPlayer
@synthesize cards = _cards;

- (NSMutableArray *)cards {
  if (!_cards) {
    _cards = [NSMutableArray array];
  }
  return _cards;
}

- (NSUInteger)numberOfCards {
  return [self.cards count];
}

- (void)addCard:(id)card {
  [self.cards addObject: card];
}

@end

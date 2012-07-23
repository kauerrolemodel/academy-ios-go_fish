//
//  RMSDeckOfCards.m
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSDeckOfCards.h"
#import "RMSPlayingCard.h"

@interface RMSDeckOfCards ()
@property (nonatomic, strong, readonly) NSMutableArray *cards;
@end


@implementation RMSDeckOfCards
@synthesize cards = _cards;

- (id)init {
  self = [super init];
  if (self) {
    _cards = [NSMutableArray arrayWithCapacity:52];
    for (NSString *rank in [RMSPlayingCard ranks]) {
      for (NSString *suit in [RMSPlayingCard suits]) {
        [_cards addObject: [[RMSPlayingCard alloc] initWithRank: rank suit: suit] ];
      };
    };
  }
  return self;
}

- (NSUInteger)numberOfCards {
  return [self.cards count];
}
         
- (RMSPlayingCard *)draw {
  RMSPlayingCard *card = [self.cards lastObject];
  [self.cards removeLastObject];
  return card;
}
         
@end

//
//  RMSDeckOfCards.m
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSDeckOfCards.h"
#import "RMSPlayingCard.h"
#import "RMSCardPlayerDelegate.h"

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

- (void)deal:(NSUInteger)numberOfCards to:(NSArray *)players {
  for (int i=0; i<numberOfCards; i++) {
    for (id<RMSCardPlayerDelegate> player in players) {
      [player addCard: [self draw]];
    }
  }
}
         
@end

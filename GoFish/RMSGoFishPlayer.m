//
//  RMSGoFishPlayer.m
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSGoFishPlayer.h"
#import "RMSCardPlayer.h"
#import "RMSPlayingCard.h"

@interface RMSGoFishPlayer ()
@property (nonatomic, strong, readwrite) NSMutableArray *cards;
@end

@implementation RMSGoFishPlayer

- (BOOL)ask:(RMSGoFishPlayer *)opponent for:(NSString *)rank {
  NSArray *cards = [opponent cardsOfRank: rank];
  [self.cards addObjectsFromArray:cards ];
  [opponent.cards removeObjectsInArray:cards ];
  return [cards count ] > 0;
}

- (NSArray *)cardsOfRank: (NSString *)rank {
  NSMutableArray *hits = [NSMutableArray arrayWithCapacity: 4];
  for (RMSPlayingCard *card in self.cards) {
    if (rank == card.rank) {
      [hits addObject:card];
    }
  }
  return hits;
}


@end

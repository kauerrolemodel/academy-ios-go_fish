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
@property (nonatomic, strong, readwrite) NSArray *books;
@end

@implementation RMSGoFishPlayer
@synthesize books = _books;

- (BOOL)ask:(RMSGoFishPlayer *)opponent for:(NSString *)rank {
  NSArray *cards = [opponent cardsOfRank: rank];
  [self.cards addObjectsFromArray:cards ];
  [opponent.cards removeObjectsInArray:cards ];
  return [cards count ] > 0;
}

- (void)addCard:(id)card {
  [super addCard:card];
  [self checkForBooks];
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

#pragma mark - Books

- (NSArray *)books {
  if (!_books) {
    _books = [NSArray array];
  }
  return _books;
}

- (void)checkForBooks {
    for (NSString *rank in [RMSPlayingCard ranks]) {
        NSArray *potentialBook = [self cardsOfRank:rank];
        if ([potentialBook count] == 4) {
            [self addBook: potentialBook];
            [self.cards removeObjectsInArray:potentialBook];
        }
    }
}

- (void)addBook: (id)book {
  self.books = [self.books arrayByAddingObject:book];
}


@end

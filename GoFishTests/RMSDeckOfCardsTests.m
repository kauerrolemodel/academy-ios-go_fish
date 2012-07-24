//
//  RMSDeckOfCardsTests.m
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSDeckOfCardsTests.h"
#import "RMSDeckOfCards.h"
#import "RMSPlayingCard.h"
#import "RMSCardPlayerDelegate.h"
#import "RMSCardPlayer.h"

@implementation RMSDeckOfCardsTests

- (void)testCreation {
  RMSDeckOfCards *deck = [RMSDeckOfCards new];
  STAssertEquals([deck numberOfCards], (NSUInteger)52, @"Wrong number of cards");
}

- (void)testDraw {
  RMSDeckOfCards *deck = [RMSDeckOfCards new];
  RMSPlayingCard *card = deck.draw;
  STAssertEquals([card class], [RMSPlayingCard class], @"Wrong type of card");
  STAssertEquals([deck numberOfCards], (NSUInteger)51, @"Draw should reduce the size of the deck");
}

- (void)testDeal {
  RMSDeckOfCards *deck = [RMSDeckOfCards new];
  id<RMSCardPlayerDelegate> player1 = [RMSCardPlayer new];
  id<RMSCardPlayerDelegate> player2 = [RMSCardPlayer new];
  [deck deal: 2 to: [NSArray arrayWithObjects: player1, player2, nil]];
  STAssertEquals(player1.numberOfCards, (NSUInteger)2, @"player1 has wrong number of cards");
  STAssertEquals(player2.numberOfCards, (NSUInteger)2, @"player2 has wrong number of cards");
}

@end

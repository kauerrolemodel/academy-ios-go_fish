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

@implementation RMSDeckOfCardsTests

- (void)testCreation {
  RMSDeckOfCards *deck = [RMSDeckOfCards new];
  STAssertEquals([deck numberOfCards], (NSUInteger)52, @"Wrong number of cards");
}

- (void)testDraw {
  RMSDeckOfCards *deck = [RMSDeckOfCards new];
  RMSPlayingCard *card = deck.draw;
  STAssertEquals([deck numberOfCards], (NSUInteger)51, @"Draw should reduce the size of the deck");
}

@end

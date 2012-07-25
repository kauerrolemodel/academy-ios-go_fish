//
//  RMSPlayingCardTests.m
//  GoFish
//
//  Created by Ken Auer on 7/24/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSPlayingCardTests.h"
#import "RMSPlayingCard.h"

@implementation RMSPlayingCardTests

-(void)testCreation {
  RMSPlayingCard *card = [RMSPlayingCard withRank: @"3" suit: @"Clubs"];
  STAssertEquals(card.rank, @"3", @"Wrong rank");
  STAssertEquals(card.suit, @"Clubs", @"Wrong suit");
}

-(void)testDescription {
  RMSPlayingCard *card = [RMSPlayingCard withRank: @"3" suit: @"Clubs"];
  STAssertEqualObjects(card.description, @"3-of-Clubs", @"Should show user friendly description");
}

-(void)testIsEqual {
  RMSPlayingCard *threeOfClubs = [RMSPlayingCard withRank: @"3" suit: @"Clubs"];
  RMSPlayingCard *threeOfClubs2 = [RMSPlayingCard withRank: @"3" suit: @"Clubs"];
  RMSPlayingCard *threeOfSpades = [RMSPlayingCard withRank: @"3" suit: @"Spades"];
  RMSPlayingCard *fourOfSpades = [RMSPlayingCard withRank: @"4" suit: @"Spades"];
  STAssertEqualObjects(threeOfClubs, threeOfClubs2, @"Two cards with same rank and suit should be equal");
  STAssertEquals(threeOfClubs.hash, threeOfClubs2.hash, @"Two equal cards should have same hash");
  STAssertFalse([threeOfClubs isEqual:threeOfSpades], @"Two cards with different suits should not be equal");
  STAssertFalse([fourOfSpades isEqual:threeOfSpades], @"Two cards with different ranks should not be equal");
}

@end

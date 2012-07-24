//
//  RMSGoFishPlayerTests.m
//  GoFish
//
//  Created by Ken Auer on 7/24/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import "RMSGoFishPlayerTests.h"
#import "RMSGoFishPlayer.h"
#import "RMSPlayingCard.h"

@implementation RMSGoFishPlayerTests

- (void)testAddCard {
  RMSGoFishPlayer *player = [RMSGoFishPlayer new];
  STAssertEquals([player numberOfCards], (NSUInteger)0, @"Should not start with cards");
  [player addCard: [RMSPlayingCard withRank: @"2" suit: @"Clubs"] ];
  STAssertEquals([player numberOfCards], (NSUInteger)1, @"Should have a card");
  
  //check for books
}

- (void)testAskPlayerForCard {
  RMSGoFishPlayer *player1 = [RMSGoFishPlayer new];
  [player1 addCard:[RMSPlayingCard withRank:@"3" suit:@"Clubs"]];
  [player1 addCard:[RMSPlayingCard withRank:@"4" suit:@"Clubs"]];
  RMSGoFishPlayer *player2 = [RMSGoFishPlayer new];
  [player2 addCard:[RMSPlayingCard withRank:@"3" suit:@"Hearts"]];
  [player2 addCard:[RMSPlayingCard withRank:@"5" suit:@"Hearts"]];
  BOOL success = [player1 ask: player2 for: @"3"];
  STAssertTrue(success, @"Should have returned true when opponent has card");
  STAssertEquals(player1.numberOfCards, (NSUInteger)3, @"player1 should have player2's 3");
  STAssertEquals(player2.numberOfCards, (NSUInteger)1, @"player2 should have given his 3");

  success = [player1 ask: player2 for: @"3"];
  STAssertFalse(success, @"Should not have indicated success when opponent doesn't have card");
  STAssertEquals(player1.numberOfCards, (NSUInteger)3, @"player1 should not have any of player2's cards");
  STAssertEquals(player2.numberOfCards, (NSUInteger)1, @"player2 should have given any of his cards");
}

- (void)testCardsOfRank {
  RMSGoFishPlayer *player = [RMSGoFishPlayer new];
  RMSPlayingCard *threeOfClubs = [RMSPlayingCard withRank:@"3" suit:@"Clubs"];
  RMSPlayingCard *threeOfHearts = [RMSPlayingCard withRank:@"3" suit:@"Hearts"];
  RMSPlayingCard *fourOfClubs = [RMSPlayingCard withRank:@"4" suit:@"Clubs"];
  [player addCard: threeOfClubs];
  [player addCard: threeOfHearts];
  [player addCard: fourOfClubs];
  STAssertEquals([[player cardsOfRank:@"4"] count], (NSUInteger)1, @"should have only one 4");
  STAssertEquals([[player cardsOfRank:@"3"] count], (NSUInteger)2, @"should have two 3s");
//  NSArray *expected = [NSArray arrayWithObjects:threeOfClubs, threeOfHearts, nil];
//  STAssertEqualObjects([player cardsForRank:@"3"], expected, @"should have two 3s");
  
}

@end

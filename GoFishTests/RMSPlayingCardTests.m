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

@end

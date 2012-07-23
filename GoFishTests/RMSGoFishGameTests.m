#import "RMSGoFishGameTests.h"
#import "RMSGoFishGame.h"
#import "RMSGoFishPlayer.h"
#import "RMSDeckOfCards.h"

@implementation RMSGoFishGameTests

- (void)testGameCreation {
  RMSGoFishGame *game = [RMSGoFishGame new];
  STAssertNotNil(game,@"Creation of GoFishGame failed");
  NSArray *players = game.players;
  STAssertEquals([players count], (NSUInteger)4, @"Incorrect number of players");
  for (RMSGoFishPlayer *player in players) {
    STAssertEqualObjects([player class], [RMSGoFishPlayer class], @"Wrong class of player");
  }
  [players enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    STAssertEqualObjects([obj class], [RMSGoFishPlayer class], @"Wrong class of player");
  }];
  RMSDeckOfCards *deck = game.deck;
  STAssertNotNil(deck, @"Missing Deck");
}



@end

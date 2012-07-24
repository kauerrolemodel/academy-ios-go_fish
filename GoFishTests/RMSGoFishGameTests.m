#import "RMSGoFishGameTests.h"
#import "RMSGoFishGame.h"
#import "RMSGoFishPlayer.h"
#import "RMSDeckOfCards.h"
#import "RMSPlayingCard.h"

@interface RMSGoFishPlayer (TestingMethods)
@property (nonatomic, strong, readwrite) NSMutableArray *cards;
@end

@interface RMSGoFishGameTests ()
@property (nonatomic, strong) RMSGoFishGame *game;
@end


@implementation RMSGoFishGameTests
@synthesize game;

- (void)setUp {
  [super setUp];
  game = [RMSGoFishGame new];
}

- (void)testGameCreation {
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
  //Should test that deck is shuffled
}

- (void)testDeal {
  [game deal];
  for (RMSGoFishPlayer *player in game.players) {
    STAssertEquals(player.numberOfCards, (NSUInteger)5, @"Wrong number of cards dealt to player");
  }
}

- (void)testCurrentPlayer {
  STAssertEquals(game.currentPlayer, [game.players objectAtIndex: 0], @"Current player should be first");
}

- (void)testTakingTurnWithNoSuccess {
  RMSGoFishPlayer *originalPlayer = game.currentPlayer;
  RMSGoFishPlayer *opponent = [game.players lastObject];
  originalPlayer.cards = [NSMutableArray arrayWithObjects:
                         [RMSPlayingCard withRank: @"3" suit: @"Clubs"], 
                         [RMSPlayingCard withRank: @"4" suit: @"Clubs"], 
                         nil ];
  opponent.cards = [NSMutableArray arrayWithObjects:
                         [RMSPlayingCard withRank: @"2" suit: @"Hearts"], 
                         [RMSPlayingCard withRank: @"4" suit: @"Hearts"], 
                         nil ];
  [game takeTurnAsking: opponent for: @"3" ];
  STAssertEquals(game.currentPlayer, opponent, @"Should have switched turns");
  STAssertEquals(originalPlayer.numberOfCards, (NSUInteger)3, @"Original player should have picked up a card from the deck");
  STAssertEquals(opponent.numberOfCards, (NSUInteger)2, @"opponent hand should be unaffected");
  
  //check for books
  //check for end game
  
}

- (void)testTakingTurnWithSuccess {
  RMSGoFishPlayer *originalPlayer = game.currentPlayer;
  RMSGoFishPlayer *opponent = [game.players lastObject];
  originalPlayer.cards = [NSMutableArray arrayWithObjects:
                          [RMSPlayingCard withRank: @"3" suit: @"Clubs"], 
                          [RMSPlayingCard withRank: @"4" suit: @"Clubs"], 
                          nil ];
  opponent.cards = [NSMutableArray arrayWithObjects:
                    [RMSPlayingCard withRank: @"2" suit: @"Hearts"], 
                    [RMSPlayingCard withRank: @"4" suit: @"Hearts"], 
                    nil ];
  [game takeTurnAsking: opponent for: @"4" ];
  STAssertEquals(game.currentPlayer, originalPlayer, @"Should have kept same players turn");
  STAssertEquals(originalPlayer.numberOfCards, (NSUInteger)3, @"Original player should have picked up a card from the opponent");
  STAssertEquals(opponent.numberOfCards, (NSUInteger)1, @"opponent hand should be missing the 4");
  
  //check for books
  //check for end game
  
}





@end

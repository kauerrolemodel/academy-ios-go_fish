#import "RMSGoFishGameTests.h"
#import "RMSGoFishGame.h"
#import "RMSGoFishPlayer.h"
#import "RMSDeckOfCards.h"
#import "RMSPlayingCard.h"

@interface RMSGoFishPlayer (TestingMethods)
@property (nonatomic, strong, readwrite) NSMutableArray *cards;
@property (nonatomic, strong, readwrite) NSArray *books;
@end

@interface RMSDeckOfCards (TestingMethods)
@property (nonatomic, strong, readwrite) NSMutableArray *cards;
@end

@interface RMSGoFishGameTests ()
@property (nonatomic, strong) RMSGoFishGame *game;
@end


@implementation RMSGoFishGameTests

- (void)setUp {
  [super setUp];
  _game = [RMSGoFishGame new];
}

- (void)testGameCreation {
  STAssertNotNil(self.game,@"Creation of GoFishGame failed");
  NSArray *players = self.game.players;
  STAssertEquals([players count], (NSUInteger)4, @"Incorrect number of players");
  for (RMSGoFishPlayer *player in players) {
    STAssertEqualObjects([player class], [RMSGoFishPlayer class], @"Wrong class of player");
  }
  [players enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    STAssertEqualObjects([obj class], [RMSGoFishPlayer class], @"Wrong class of player");
  }];
  RMSDeckOfCards *deck = self.game.deck;
  STAssertNotNil(deck, @"Missing Deck");
  STAssertFalse([[NSArray arrayWithArray:deck.cards] isEqual:[NSArray arrayWithArray:[[RMSDeckOfCards new] cards]]], @"Deck should not be in original order");
}

- (void)testDeal {
  [self.game deal];
  for (RMSGoFishPlayer *player in self.game.players) {
    STAssertEquals(player.numberOfCards, (NSUInteger)5, @"Wrong number of cards dealt to player");
  }
}

- (void)testCurrentPlayer {
  STAssertEquals(self.game.currentPlayer, [self.game.players objectAtIndex: 0], @"Current player should be first");
}

- (void)testTakingTurnWithNoSuccess {
  RMSGoFishPlayer *originalPlayer = self.game.currentPlayer;
  RMSGoFishPlayer *opponent = [self.game.players lastObject];
  originalPlayer.cards = [NSMutableArray arrayWithObjects:
                         [RMSPlayingCard withRank: @"3" suit: @"Clubs"], 
                         [RMSPlayingCard withRank: @"4" suit: @"Clubs"], 
                         nil ];
  opponent.cards = [NSMutableArray arrayWithObjects:
                         [RMSPlayingCard withRank: @"2" suit: @"Hearts"], 
                         [RMSPlayingCard withRank: @"4" suit: @"Hearts"], 
                         nil ];
  [self.game takeTurnAsking: opponent for: @"3" ];
  STAssertEquals(self.game.currentPlayer, opponent, @"Should have switched turns");
  STAssertEquals(originalPlayer.numberOfCards, (NSUInteger)3, @"Original player should have picked up a card from the deck");
  STAssertEquals(opponent.numberOfCards, (NSUInteger)2, @"opponent hand should be unaffected");
}

- (void)testIsOverWhenDeckIsEmpty {
  self.game.deck.cards = [NSMutableArray array];
  STAssertTrue([self.game isOver], @"Should be over when deck is empty");
}

- (void)testIsOverWhenPlayerIsOutOfCards {
  self.game.currentPlayer.cards = [NSMutableArray array];
  STAssertTrue([self.game isOver], @"Should be over when player is out of cards");
}

//- (void)testWinner {
//  RMSGoFishPlayer *winningPlayer = game.currentPlayer;
//  for (RMSGoFishPlayer *player in game.players) {
//    STAssertEquals([player.books count], 0, @"All players should have no books at start");
//  }
//  for (NSString *suit in [RMSPlayingCard suits]) {
//    [winningPlayer addCard:[RMSPlayingCard withRank:@"3" suit:suit]];
//  }
//  STAssertTrue([game isOver], @"Should be over when player is out of cards");
//  STAssertEquals([game winner], winningPlayer, @"Player with book should be winner");
//}

- (void)testTakingTurnWithSuccess {
  RMSGoFishPlayer *originalPlayer = self.game.currentPlayer;
  RMSGoFishPlayer *opponent = [self.game.players lastObject];
  originalPlayer.cards = [NSMutableArray arrayWithObjects:
                          [RMSPlayingCard withRank: @"3" suit: @"Clubs"], 
                          [RMSPlayingCard withRank: @"4" suit: @"Clubs"], 
                          nil ];
  opponent.cards = [NSMutableArray arrayWithObjects:
                    [RMSPlayingCard withRank: @"2" suit: @"Hearts"], 
                    [RMSPlayingCard withRank: @"4" suit: @"Hearts"], 
                    nil ];
  [self.game takeTurnAsking: opponent for: @"4" ];
  STAssertEquals(self.game.currentPlayer, originalPlayer, @"Should have kept same players turn");
  STAssertEquals(originalPlayer.numberOfCards, (NSUInteger)3, @"Original player should have picked up a card from the opponent");
  STAssertEquals(opponent.numberOfCards, (NSUInteger)1, @"opponent hand should be missing the 4");
}





@end

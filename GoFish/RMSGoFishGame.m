#import "RMSGoFishGame.h"
#import "RMSGoFishPlayer.h"
#import "RMSDeckOfCards.h"

@interface RMSGoFishGame ()
@property (nonatomic, strong, readwrite) RMSGoFishPlayer *currentPlayer;
@end

@implementation RMSGoFishGame
@synthesize players = _players;
@synthesize deck = _deck;
@synthesize currentPlayer = _currentPlayer;

- (id)init
{
  self = [super init];
  if (self) {
    _players = [NSArray  arrayWithObjects: 
                [RMSGoFishPlayer new],
                [RMSGoFishPlayer new],
                [RMSGoFishPlayer new],
                [RMSGoFishPlayer new],nil];
    _deck = [RMSDeckOfCards new];
    [_deck shuffle];
    _currentPlayer = [_players objectAtIndex:0];
  }
  return self;
}

- (BOOL)isOver {
  if ([self.deck numberOfCards] == 0) {
    return YES;
  } else {
    for (RMSGoFishPlayer *player in self.players) {
      if ([player numberOfCards] == 0) {
        return YES;
      }
    }
  }
  return NO;
}

- (void)deal {
  [self.deck deal: 5 to: self.players];
}

- (void)takeTurnAsking:(RMSGoFishPlayer *)opponent for:(NSString *)rank {
  if (![self.currentPlayer ask:opponent for:rank]) {
    [self.currentPlayer addCard: [self.deck draw]];
    self.currentPlayer = opponent;
  }
}
@end

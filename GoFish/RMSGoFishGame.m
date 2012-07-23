#import "RMSGoFishGame.h"
#import "RMSGoFishPlayer.h"
#import "RMSDeckOfCards.h"

@implementation RMSGoFishGame
@synthesize players = _players;
@synthesize deck = _deck;

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
  }
  return self;
}
@end

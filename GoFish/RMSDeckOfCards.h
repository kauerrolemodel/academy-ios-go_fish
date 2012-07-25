//
//  RMSDeckOfCards.h
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RMSPlayingCard;

@interface RMSDeckOfCards : NSObject

- (NSUInteger)numberOfCards;
- (RMSPlayingCard *)draw;
- (void)deal: (NSUInteger)numberOfCards to: (NSArray *)players;
- (void)shuffle;

@end

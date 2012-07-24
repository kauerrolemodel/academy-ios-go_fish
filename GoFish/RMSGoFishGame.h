//
//  RMSGoFishGame.h
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RMSDeckOfCards;
@class RMSGoFishPlayer;

@interface RMSGoFishGame : NSObject
@property (nonatomic, strong, readonly) NSArray *players;
@property (nonatomic, strong, readonly) RMSDeckOfCards *deck;
@property (nonatomic, strong, readonly) RMSGoFishPlayer *currentPlayer;

- (void)deal;
- (void)takeTurnAsking: (RMSGoFishPlayer *)opponent for: (NSString *)rank;
@end

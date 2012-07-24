//
//  RMSGoFishPlayer.h
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMSCardPlayer.h"

@interface RMSGoFishPlayer : RMSCardPlayer

- (BOOL)ask: (RMSGoFishPlayer *)opponent for: (NSString *)rank; 
- (NSArray *)cardsOfRank: (NSString *)rank;

@end

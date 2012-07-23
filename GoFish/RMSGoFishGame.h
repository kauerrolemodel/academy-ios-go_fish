//
//  RMSGoFishGame.h
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RMSDeckOfCards;

@interface RMSGoFishGame : NSObject
@property (nonatomic, strong, readonly) NSArray *players;
@property (nonatomic, strong, readonly) RMSDeckOfCards *deck;
@end

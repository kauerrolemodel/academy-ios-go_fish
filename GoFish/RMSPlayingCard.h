//
//  RMSPlayingCard.h
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMSPlayingCard : NSObject
@property (nonatomic, strong) NSString *rank;
@property (nonatomic, strong) NSString *suit;

+ (NSArray *)ranks;
+ (NSArray *)suits;
+ (id)withRank: (NSString *)rank suit: (NSString *)suit;
- (id)initWithRank: (NSString *)rank suit: (NSString *)suit;

@end

//
//  RMSPlayingCard.h
//  GoFish
//
//  Created by Ken Auer on 7/23/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMSPlayingCard : NSObject
@property (nonatomic, weak) NSString *rank;
@property (nonatomic, weak) NSString *suit;

+ (NSArray *)ranks;
+ (NSArray *)suits;
- (id)initWithRank: (NSString *)rank suit: (NSString *)suit;

@end

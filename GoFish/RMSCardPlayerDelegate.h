//
//  RMSCardPlayerDelegate.h
//  GoFish
//
//  Created by Ken Auer on 7/24/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RMSCardPlayerDelegate <NSObject>

- (void)addCard: (id)card;
- (NSUInteger)numberOfCards;

@end

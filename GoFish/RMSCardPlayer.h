//
//  RMSCardPlayer.h
//  GoFish
//
//  Created by Ken Auer on 7/24/12.
//  Copyright (c) 2012 RoleModel Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMSCardPlayerDelegate.h"

@interface RMSCardPlayer : NSObject <RMSCardPlayerDelegate>
@property (nonatomic, strong, readwrite) NSMutableArray *cards;

@end

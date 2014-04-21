//
//  Tile.h
//  FusionFury
//
//  Created by Joshua Chao on 4/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"


@interface Tile : CCNode
@property (nonatomic, assign) BOOL mergedThisRound;
@property (nonatomic, assign) NSInteger value;
- (void)updateValueDisplay;

@end

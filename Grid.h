//
//  Grid.h
//  FusionFury
//
//  Created by Joshua Chao on 4/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNodeColor.h"
#import "MainScene.h"

@interface Grid : CCNodeColor

- (void)endGameWithMessage:(NSString*)message;


@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) BOOL lost;
@property (nonatomic, weak) MainScene *mainscene;


@end

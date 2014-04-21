//
//  MenuScene.m
//  FusionFury
//
//  Created by Joshua Chao on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "MenuScene.h"
#import "CCTransition.h"


@implementation MenuScene

- (void) play {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:[CCTransition transitionCrossFadeWithDuration:2.0f]];
}

@end

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
    [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:[CCTransition transitionCrossFadeWithDuration:1.0f]];
}

- (void) credits {
    CCScene *creditScene = [CCBReader loadAsScene :@"CreditsScene"];
    [[CCDirector sharedDirector] replaceScene:creditScene withTransition:[CCTransition transitionCrossFadeWithDuration:1.0f]];
}

// add options button, credits button, T-10 mode, time trial mode





@end

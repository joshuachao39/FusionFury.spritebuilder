//
//  CreditsScene.m
//  FusionFury
//
//  Created by Joshua Chao on 4/21/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CreditsScene.h"

@implementation CreditsScene

- (void) back{
    CCScene *backScene = [CCBReader    loadAsScene:@"MenuScene"];
    [[CCDirector sharedDirector] replaceScene:backScene withTransition:[CCTransition transitionCrossFadeWithDuration:1.0f]];

}

@end

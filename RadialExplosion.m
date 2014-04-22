//
//  RadialExplosion.m
//  FusionFury
//
//  Created by Joshua Chao on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "RadialExplosion.h"

@implementation RadialExplosion

-(void) didLoadFromCCB {
    
    [self performSelector:@selector(radialExplosion) withObject:nil];
    NSLog(@"explosion happened");
    
}

-(void) radialExplosion {
    CCBAnimationManager* animationManager = self.userObject;
    [animationManager runAnimationsForSequenceNamed:@"RadialExplosion"];
}

-(void) radialExplosionComplete {
    [self removeFromParent];
}
@end

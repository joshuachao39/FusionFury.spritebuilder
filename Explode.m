//
//  Explode.m
//  cocos2d-ios
//
//  Created by Joshua Chao on 4/20/14.
//
//

#import "Explode.h"
#import "Grid.h"
//#import "CCBAnimationManager.h"


@implementation Explode
Grid *_grid;

-(void) didLoadFromCCB {
    
    [self performSelector:@selector(explode) withObject:nil];
    NSLog(@"explosion happened");
    
}



-(void) explode {
    CCBAnimationManager* animationManager = self.userObject;
    [animationManager runAnimationsForSequenceNamed:@"Explode"];
}

- (void)crossAnimationComplete {
    [self removeFromParent];
}

@end

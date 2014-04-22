//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"

int countdown;
float timeSinceUpdate;
int actualTime;
BOOL pauseScene;

@implementation MainScene {
    Grid *_grid;
    CCLabelTTF *_scoreLabel;
    CCLabelTTF *_highscoreLabel;
    CCLabelTTF *_timerLabel;
}


- (void)didLoadFromCCB {
    [_grid addObserver:self forKeyPath:@"score" options:0 context:NULL];
    [[NSUserDefaults standardUserDefaults] addObserver:self
                                            forKeyPath:@"highscore"
                                               options:0
                                               context:NULL];
    // load highscore
    [self updateHighscore];
    [self initialize];
    _grid.mainscene = self;
	
}

- (void) initialize {
    
    
    countdown =  10;
    timeSinceUpdate = 0;
    self.timeUp = FALSE;
    actualTime = 0;
    [self updateTime:(countdown)];
    
    
    //pause scene
    //User should not be able to interact
    pauseScene = TRUE;
    self.UserInteractionEnabled = FALSE;
    //Timer should not run
    
    //1st Sprite
//    CCSprite *spriteCountdown1 = [CCSpriteFrame frameWithImageNamed:@"countdown3.png"];
//    CCSprite *spriteCountdown2 = [CCSpriteFrame frameWithImageNamed:@"countdown2.png"];
//    CCSprite *spriteCountdown3 = [CCSpriteFrame frameWithImageNamed:@"countdown1.png"];
//    CCSprite *spriteCountdown4 = [CCSpriteFrame frameWithImageNamed:@"countdownGO.png"];
   // spriteCountdown1.visible = YES;
    
    //2nd Sprite
    if (actualTime == 3) {
  //      spriteCountdown1.visible = NO;
        
   //     spriteCountdown2.visible = YES;
    }
    
    //3rd Sprite
    if (actualTime == 5) {
 //       spriteCountdown2.visible = NO;
 //       spriteCountdown3.visible = YES;
    }
    
    //4th Sprite
    if (actualTime == 7) {
  //      spriteCountdown3.visible = NO;
 //       spriteCountdown4.visible = YES;
    }
    
    //destroy sprites
  //  [self removeChild: spriteCountdown1];
  //  [self removeChild: spriteCountdown2];
  //  [self removeChild: spriteCountdown3];
  //  [self removeChild: spriteCountdown4];
    
    //User should be able to interact
    self.userInteractionEnabled = TRUE;
    
    //Timer should run
    pauseScene = FALSE;
    

    
    
}

- (void)updateHighscore {
    NSNumber *newHighscore = [[NSUserDefaults standardUserDefaults] objectForKey:@"highscore"];
    if (newHighscore) {
        _highscoreLabel.string = [NSString stringWithFormat:@"%d", [newHighscore intValue]];
    }
}

-(void)updateTime: (int) countdown   {
    _timerLabel.string = [NSString stringWithFormat:@"%d", countdown];
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"score"]) {
        _scoreLabel.string = [NSString stringWithFormat:@"%d", _grid.score];
    } else if ([keyPath isEqualToString:@"highscore"]) {
        [self updateHighscore];
    }
}
- (void)dealloc {
    [_grid removeObserver:self forKeyPath:@"score"];
}

- (void)update:(CCTime)delta
{
    timeSinceUpdate = timeSinceUpdate + delta;
    if (timeSinceUpdate > 1 && pauseScene == FALSE && _grid.lost == FALSE) {
        countdown = countdown - 1;
        if (countdown > -1) {
        [self updateTime: (countdown)];
        timeSinceUpdate = 0;
        }
    }
    
    if (timeSinceUpdate > 1 && pauseScene == TRUE) {
        actualTime = actualTime + 1;
        timeSinceUpdate = 0;
    }
    
    if(countdown < 10) {
        _timerLabel.color = [CCColor colorWithRed:255.f/255.f green:140.f/255.f blue:135.f/255.f];
    }
    else {
        _timerLabel.color = [CCColor colorWithRed:255.f/255.f green:255.f/255.f blue:255.f/255.f];
    }
    
    if(countdown ==0) {
        [_grid endGameWithMessage:@"time's up!"];
        self.timeUp = TRUE;
        
        
    }
    


    
    // this will be run every frame.
    // delta is the time that has elapsed since the last time it was run.
}




    

@end

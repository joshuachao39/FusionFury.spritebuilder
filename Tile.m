//
//  Tile.m
//  FusionFury
//
//  Created by Joshua Chao on 4/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Tile.h"

@implementation Tile {
    CCLabelTTF *_valueLabel;
    CCLabelTTF *_elementValue;
    CCNodeColor *_backgroundNode;
}

- (id)init {
    self = [super init];
    if (self) {
        
        float x = drand48();
        NSLog(@"%f",x);

        if (x < 0.20)    {   //  40%
            self.value = 1;
            NSLog(@"neutron created");
            
        }
        else if (x < 0.6 && 0.2 <= x) {  //  20% + 20%
            self.value = 23;
            NSLog(@"Vanadium created");
        }
        else if (x>=0.6)  { //  5% + 20% + 30%
            self.value = 46;
            NSLog(@"Palladium created");
        }
        
        
        
        //self.value = (arc4random()%2+1)*23;
       // self.value = 1;
    }
    return self;
}



- (void)updateValueDisplay {
    _valueLabel.string = [NSString stringWithFormat:@"%d", self.value];
    if (self.value == 23) {
        _elementValue.string = [NSString stringWithFormat:@"V"];
    }
    else if (self.value == 46) {
        _elementValue.string = [NSString stringWithFormat:@"Pd"];
    }
    else if (self.value == 92) {
        _elementValue.string = [NSString stringWithFormat:@"U"];
    }
    else if (self.value == 1) {
        _elementValue.string = [NSString stringWithFormat:@"n"];
    }
   CCColor *backgroundColor = nil;
    CCColor *textColor = nil;
    
    switch (self.value) {
        case 1:
            backgroundColor = [CCColor colorWithRed:200.f/255.f green:207.f/255.f blue:180.f/255.f];
        case 23:
            backgroundColor = [CCColor colorWithRed:223.f/255.f green:219.f/255.f blue:214.f/255.f];
            textColor = [CCColor colorWithRed:119.f/255.f green:104.f/255.f blue:101.f/255.f];
            break;
        case 46:
            backgroundColor = [CCColor colorWithRed:238.f/255.f green:200.f/255.f blue:143.f/255.f];
            textColor = [CCColor colorWithRed:250.f/255.f green:248.f/255.f blue:239.f/255.f];
            break;
        case 92:
            backgroundColor = [CCColor colorWithRed:109.f/255.f green:146.f/255.f blue:155.f/255.f];
            textColor = [CCColor colorWithRed:250.f/255.f green:248.f/255.f blue:239.f/255.f];
            break;
    }
    _backgroundNode.color = backgroundColor;
    _valueLabel.color = textColor;
    _elementValue.color = textColor;
    
}

- (void)didLoadFromCCB {
    [self updateValueDisplay];
}

@end

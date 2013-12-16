//
//  Knight.m
//  SpriteAnimation
//
//  Created by Benjamin Encz on 16/12/13.
//  Copyright (c) 2013 MakeGamesWithUs. All rights reserved.
//

#import "Knight.h"

@implementation Knight

static BOOL spriteFramesInitialized;

+ (void)initializeSpriteFrames {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"animation_knight.plist"];
    
    spriteFramesInitialized = TRUE;
}

- (id)initKnight {
    if (!spriteFramesInitialized) {
        [Knight initializeSpriteFrames];
    }
    
    CCSpriteFrame *initialSpriteFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"animation_knight-1.png"];
    
    self = [super initWithSpriteFrame:initialSpriteFrame];
    
    if (self)
    {
        
        // ************* RUNNING ANIMATION ********************
        NSMutableArray *animationFramesRun = [NSMutableArray array];
        
        for(int i = 1; i <= 4; ++i)
        {
            [animationFramesRun addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"animation_knight-%d.png", i]]];
        }
        
        //Create an animation from the set of frames you created earlier
        CCAnimation *running = [CCAnimation animationWithSpriteFrames: animationFramesRun delay:0.1f];
        
        //Create an action with the animation that can then be assigned to a sprite
        CCActionRepeatForever *run = [CCActionRepeatForever actionWithAction: [CCActionAnimate actionWithAnimation:running]];
        [self runAction:run];
    }
    
    return self;
}

@end

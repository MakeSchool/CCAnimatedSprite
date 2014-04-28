/*
 *  Knight.m
 *  SpriteAnimation
 *
 *  Created by Benjamin Encz on 16/12/13.
 *  Copyright (c) 2013 - 2014 MakeGamesWithUs.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

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

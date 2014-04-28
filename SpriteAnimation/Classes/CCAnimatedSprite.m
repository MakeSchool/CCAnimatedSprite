/*
*  CCAnimatedSprite.m
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

#import "CCAnimatedSprite.h"
#import "CCAnimation.h"

@interface CCAnimatedSprite()

- (id)initWithPlist:(NSString*)plistName;

/*
 key = animationName
 value = CCActionAnimate
 */
@property (nonatomic, strong) NSMutableDictionary *animations;
@property (nonatomic, strong) CCAction *currentAnimation;

@end

@implementation CCAnimatedSprite

static NSMutableArray *chachedSprites;

#pragma mark - Factory Method

+ (instancetype)animatedSpriteWithPlist:(NSString*)animationPlist {
    return [[CCAnimatedSprite alloc] initWithPlist:animationPlist];
}

#pragma mark - Frame Loading

+ (void)addSpritesToCache:(NSString*)animationPlist {
    if ([chachedSprites containsObject:animationPlist]) {
        // images from this animation have already been loaded
        return;
    }
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:animationPlist];
    [chachedSprites addObject:animationPlist];
}

#pragma mark - Initializer

- (id)initWithPlist:(NSString*)animationPlist {
    [CCAnimatedSprite addSpritesToCache:animationPlist];
    
    self = [super init];
    
    if (self) {
        self.animations = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark - Animation Handling

- (void)addAnimationwithDelayBetweenFrames:(float)delay name:(NSString *)animationName {
    NSMutableArray *animationFrames = [NSMutableArray array];
    
    for(int i = 1; i <= INT_MAX; ++i)
    {
        CCSpriteFrame *spriteFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"%@-%d.png",animationName, i]];
        if (spriteFrame != nil) {
            [animationFrames addObject:spriteFrame];
        } else {
            break;
        }
    }
    
    //Create an animation from the set of frames you created earlier
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames: animationFrames delay:delay];
    
    //Create an action with the animation that can then be assigned to a sprite
    CCActionAnimate *animationAction = [CCActionAnimate actionWithAnimation:animation];
    
    // store this action, connected to the animationName
    self.animations[animationName] = animationAction;
}

- (void)runAnimation:(NSString*)animationName {
    if (self.currentAnimation) {
        [self stopAnimation];
    }
    
    CCActionAnimate *animationAction = self.animations[animationName];
    CCActionRepeatForever *repeatingAnimation = [CCActionRepeatForever actionWithAction:animationAction];
    [self runAction:repeatingAnimation];
    self.currentAnimation = repeatingAnimation;
}

- (void)stopAnimation {
    [self stopAction:self.currentAnimation];
    self.currentAnimation = nil;
}

#pragma mark - Manual Frame setting

- (void)setFrame:(NSString*)frameName {
    CCSpriteFrame *spriteFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName];
    
    [self setSpriteFrame:spriteFrame];
}

- (CCActionAnimate*)animationByName:(NSString*)animationName {
    return self.animations[animationName];
}

@end

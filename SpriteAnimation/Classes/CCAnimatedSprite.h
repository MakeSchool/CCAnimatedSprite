//
//  CCAnimatedSprite.h
//  SpriteAnimation
//
//  Created by Benjamin Encz on 16/12/13.
//  Copyright (c) 2013 MakeGamesWithUs. All rights reserved.
//

#import "CCSprite.h"

@interface CCAnimatedSprite : CCSprite

+ (instancetype)animatedSpriteWithPlist:(NSString*)plistName;

- (void)addAnimationwithDelayBetweenFrames:(float)delay name:(NSString *)animationName;
- (void)runAnimation:(NSString*)animationName;
- (void)stopAnimation;

- (void)setFrame:(NSString*)frameName;

@end

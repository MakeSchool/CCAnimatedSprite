//
//  HelloWorldScene.m
//  MGWU
//
//  Created by Benjamin Encz on 11/12/13.
//  Copyright MakeGamesWithUs 2013. All rights reserved.
//
// -----------------------------------------------------------------------

#import "HelloWorldScene.h"
#import "Knight.h"
#import "CCAnimatedSprite.h"

@implementation HelloWorldScene {
    CCAnimatedSprite *animatedSprite;
}


+ (HelloWorldScene *)scene
{
    return [[self alloc] init];
}

- (id)init
{
    if (self = [super init])
    {
        glClearColor(0.2f, 0.2f, 0.2f, 1.f);
        
        // ************* CREATE MENU ********************
        
        CCButton *runAnimationButton = [CCButton buttonWithTitle:@"'Run'"];
        [runAnimationButton setTarget:self selector:@selector(runAnimationButtonTouched)];
        
        CCButton *stabAnimationButton = [CCButton buttonWithTitle:@"'Stab'"];
        [stabAnimationButton setTarget:self selector:@selector(stabAnimationButtonTouched)];
        
        CCButton *stopAnimationButton = [CCButton buttonWithTitle:@"Stop"];
        [stopAnimationButton setTarget:self selector:@selector(stopAnimationButtonTouched)];
        
        CCButton *customFrameButton = [CCButton buttonWithTitle:@"Custom frame"];
        [customFrameButton setTarget:self selector:@selector(customFrameButtonTouched)];
        
        CCButton *manualAnimationButton = [CCButton buttonWithTitle:@"Manual animation"];
        [manualAnimationButton setTarget:self selector:@selector(manualAnimationButtonTouched)];
        
        CCLayoutBox *layoutBox = [[CCLayoutBox alloc] init];
        layoutBox.anchorPoint = ccp(0.5f, 0.5f);
        [layoutBox addChild:runAnimationButton];
        [layoutBox addChild:stabAnimationButton];
        [layoutBox addChild:stopAnimationButton];
        [layoutBox addChild:customFrameButton];
        [layoutBox addChild:manualAnimationButton];

        layoutBox.spacing = 10.f;
        layoutBox.direction = CCLayoutBoxDirectionHorizontal;
        [layoutBox layout];
        layoutBox.positionType = CCPositionTypeNormalized;

        layoutBox.position = ccp(0.5f, 0.2f);
        [self addChild:layoutBox];
        
        // ************* CREATE ANIMATION ********************
        
        animatedSprite = [CCAnimatedSprite animatedSpriteWithPlist:@"animation_knight.plist"];
        [animatedSprite addAnimationwithDelayBetweenFrames:0.1f name:@"animation_knight"];
        [animatedSprite addAnimationwithDelayBetweenFrames:0.1f name:@"animation_knight-stab"];
        animatedSprite.positionType = CCPositionTypeNormalized;
        animatedSprite.position = ccp(0.5f, 0.5f);
        [animatedSprite runAnimation:@"animation_knight"];
        [self addChild:animatedSprite];
    }
    
	return self;
}

- (void)runAnimationButtonTouched {
    [animatedSprite runAnimation:@"animation_knight"];
}

- (void)stabAnimationButtonTouched {
    [animatedSprite runAnimation:@"animation_knight-stab"];
}

- (void)stopAnimationButtonTouched {
    [animatedSprite stopAnimation];
}

- (void)customFrameButtonTouched {
    [animatedSprite setFrame:@"animation_knight-1.png"];
}

- (void)manualAnimationButtonTouched {
    // load the animation
    CCActionAnimate *animation = [animatedSprite animationByName:@"animation_knight"];
    
    // stop any current animation
    [animatedSprite stopAnimation];
    
    // run loaded animation once
    [animatedSprite runAction:animation];
}

@end
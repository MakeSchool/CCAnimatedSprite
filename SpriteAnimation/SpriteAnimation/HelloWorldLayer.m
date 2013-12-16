//
//  HelloWorldLayer.m
//  SpriteAnimation
//
//  Created by Benjamin Encz on 16/12/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "CCAnimatedSprite.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    glClearColor(0.2f, 0.2f, 0.2f, 1.f);
    
	if( (self=[super init]) ) {
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

		// add the label as a child to this Layer
        CCAnimatedSprite *animatedSprite = [CCAnimatedSprite animatedSpriteWithPlist:@"animation_knight.plist"];
        [animatedSprite setFrame:@"animation_knight-1.png"];
        [animatedSprite addAnimationwithDelayBetweenFrames:0.1f name:@"animation_knight"];
        CCAnimate *animation = [animatedSprite animationByName:@"animation_knight"];
        animatedSprite.position = ccp( size.width /2 , size.height/2 );
		[self addChild:animatedSprite];
        
        CCRepeatForever *repeatingAnimation = [CCRepeatForever actionWithAction:animation];

        [animatedSprite runAction:repeatingAnimation];
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end

//
//  CCAnimatedSprite.h
//  SpriteAnimation
//
//  Created by Benjamin Encz on 16/12/13.
//  Copyright (c) 2013 MakeGamesWithUs. All rights reserved.
//

#import "CCSprite.h"

/**
 A CCSprite subclass that simplifies the creation of animations. This class needs to be initialized with a plist containing the animation information.
 */
@interface CCAnimatedSprite : CCSprite
/**
 Creates a CCAnimatedSprite and loads all SpriteFrames contained in the provided plist.
 */
+ (instancetype)animatedSpriteWithPlist:(NSString*)plistName;

/**
 Creates an animation.
 
 @param delay the amount of seconds each frame shall be presented before switching to the next animation frame
 @param name name of the animation. This name is used to reference the animation in other methods. It needs to correspond to the frame names in the plist-File.  If the animation is called "animation_knight" your frames in the .plist need to be called "animation_knight-1.png", "animation_knight-2.png" and so forth.
 */
- (void)addAnimationwithDelayBetweenFrames:(float)delay name:(NSString *)animationName;

/**
 Runs an animation in a loop.
 
 @param animationName this name is used to reference an animation that has been created earlier
 */
- (void)runAnimation:(NSString*)animationName;

/**
 Stops the current animation.
 */
- (void)stopAnimation;

/** 
 Manually sets a frame. Does not stop any running animation.
 
 @param frameName name of the image that shall be presented. The image name needs to be contained in the plist-File which was used to initialize this CCAnimatedSprite instance.
 */
- (void)setFrame:(NSString*)frameName;

/**
 Provides access to Animation Actions. Can be used to manually run animations.
 
 @param animationName this name is used to reference an animation that has been created earlier
 @return returns the animation action with the corresponding name
 */
- (CCActionAnimate*)animationByName:(NSString*)animationName;

@end

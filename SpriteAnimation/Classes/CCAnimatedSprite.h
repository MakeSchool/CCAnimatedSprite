/*
 *  CCAnimatedSprite.h
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

#import "cocos2d.h"

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

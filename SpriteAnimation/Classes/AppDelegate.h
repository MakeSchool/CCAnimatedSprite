//
//  AppDelegate.h
//  MGWU
//
//  Created by Benjamin Encz on 11/12/13.
//  Copyright MakeGamesWithUs 2013. All rights reserved.
//
// -----------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "cocos2d.h"

// -----------------------------------------------------------------------

// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

// -----------------------------------------------------------------------

@interface AppController : NSObject <UIApplicationDelegate>

// -----------------------------------------------------------------------

@property (nonatomic, retain) UIWindow      *window;
@property (readonly) MyNavigationController *navController;
@property (weak, readonly) CCDirectorIOS    *director;

// -----------------------------------------------------------------------
@end
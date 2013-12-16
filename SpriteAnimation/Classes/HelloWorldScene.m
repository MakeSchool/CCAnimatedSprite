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

@implementation HelloWorldScene


+ (HelloWorldScene *)scene
{
    return [[self alloc] init];
}

- (id)init
{
    if (self = [super init])
    {
        glClearColor(0.2f, 0.2f, 0.2f, 1.f);

        Knight *knight = [[Knight alloc] initKnight];
        knight.positionType = CCPositionTypeNormalized;
        knight.position = ccp(0.5f, 0.5f);
        [self addChild:knight];
    }
	return self;
}

@end
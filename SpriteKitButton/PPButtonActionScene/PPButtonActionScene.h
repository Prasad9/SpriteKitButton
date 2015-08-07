//
//  PPButtonActionScene.h
//  SpriteKitButton
//
//  Created by Prasad Pai on 07/08/15.
//  Copyright (c) 2015 Prasad Pai. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface PPButtonActionScene : SKScene

#pragma mark - Overridden methods
- (void)touchBeginOnNodeName:(NSString *)nodeName;

- (void)touchEndedOnNodeName:(NSString *)nodeName;

- (void)touchUpInsideOnNodeName:(NSString *)nodeName atPoint:(CGPoint)touchPoint;

@end

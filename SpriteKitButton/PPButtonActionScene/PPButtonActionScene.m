//
//  PPButtonActionScene.m
//  SpriteKitButton
//
//  Created by Prasad Pai on 07/08/15.
//  Copyright (c) 2015 Prasad Pai. All rights reserved.
//

#import "PPButtonActionScene.h"

@interface PPButtonActionScene ()

@property (strong, nonatomic) NSString *touchedSpriteNodeName;
@property (assign, nonatomic) BOOL touchTransitionHappened;

@end

@implementation PPButtonActionScene

#pragma mark - Touches methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint pointOfTouch = [touch locationInNode:self];
    SKNode *topmostNode = [self nodeAtPoint:pointOfTouch];
    
    // Store the name of the node.
    if (topmostNode.name.length > 0) {
        self.touchedSpriteNodeName = topmostNode.name;
        [self touchBeginOnNodeName:self.touchedSpriteNodeName];
    }
    else {
        self.touchedSpriteNodeName = nil;
    }
    
    self.touchTransitionHappened = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint pointOfTouch = [touch locationInNode:self];
    SKNode *topmostNode = [self nodeAtPoint:pointOfTouch];
    
    // Check if tap is present on same node or not.
    if (![self.touchedSpriteNodeName isEqualToString:topmostNode.name]) {
        self.touchTransitionHappened = YES;
        
        // If not same, initiate the left action.
        if (self.touchedSpriteNodeName != nil) {
            [self touchEndedOnNodeName:self.touchedSpriteNodeName];
        }
        
        // Store the name of the node.
        if (topmostNode.name.length > 0) {
            self.touchedSpriteNodeName = topmostNode.name;
            [self touchBeginOnNodeName:self.touchedSpriteNodeName];
        }
        else {
            self.touchedSpriteNodeName = nil;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // If touch ended has name, initiate the left action.
    if (self.touchedSpriteNodeName != nil) {
        [self touchEndedOnNodeName:self.touchedSpriteNodeName];
    }
    
    // Initiate tap action if no transition made.
    if (!self.touchTransitionHappened) {
        UITouch *touch = [[touches allObjects] lastObject];
        CGPoint pointOfTouch = [touch locationInNode:self];
        
        // Should initiate touch up inside method only if node has a name.
        if ([self.touchedSpriteNodeName length] > 0) {
            [self touchUpInsideOnNodeName:self.touchedSpriteNodeName atPoint:pointOfTouch];
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Check if touch is present in named node or not.
    if (self.touchedSpriteNodeName != nil) {
        [self touchEndedOnNodeName:self.touchedSpriteNodeName];
    }
}

#pragma mark - Overridden methods
- (void)touchBeginOnNodeName:(NSString *)nodeName
{
    
}

- (void)touchEndedOnNodeName:(NSString *)nodeName
{
    
}

- (void)touchUpInsideOnNodeName:(NSString *)nodeName atPoint:(CGPoint)touchPoint
{
    
}

@end

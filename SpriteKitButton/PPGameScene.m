//
//  PPGameScene.m
//  SpriteKitButton
//
//  Created by Prasad Pai on 07/08/15.
//  Copyright (c) 2015 Prasad Pai. All rights reserved.
//

#import "PPGameScene.h"

@interface PPGameScene ()

@property (weak, nonatomic) SKLabelNode *tapOnLabel;

@end

@implementation PPGameScene

#pragma mark - Scene Life Cycle methods
- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    
    [self makeUISetup];
}

#pragma mark - Private methods
- (void)makeUISetup
{
    self.tapOnLabel = (SKLabelNode *)[self childNodeWithName:@"tapOnLabel"];
}

#pragma mark - Overridden methods
- (void)touchBeginOnNodeName:(NSString *)nodeName
{
    self.tapOnLabel.text = [NSString stringWithFormat:@"Touch started on %@", nodeName];
}

- (void)touchEndedOnNodeName:(NSString *)nodeName
{
    self.tapOnLabel.text = [NSString stringWithFormat:@"Touch ended on %@", nodeName];
}

- (void)touchUpInsideOnNodeName:(NSString *)nodeName atPoint:(CGPoint)touchPoint
{
    self.tapOnLabel.text = [NSString stringWithFormat:@"Tap on %@ at (%.2f, %.2f)", nodeName, touchPoint.x, touchPoint.y];
}

#pragma mark - Touch methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
}

@end

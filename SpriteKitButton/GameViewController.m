//
//  GameViewController.m
//  SpriteKitButton
//
//  Created by Prasad Pai on 07/08/15.
//  Copyright (c) 2015 Prasad Pai. All rights reserved.
//

#import "GameViewController.h"
#import "PPGameScene.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    SKScene *returnScene;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 8.f) {
        returnScene = scene;
    }
    else {
        returnScene = [scene copy];
    }
    return returnScene;
}

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
    // Create and configure the scene.
    PPGameScene *scene = [PPGameScene unarchiveFromFile:@"PPGameScene"];
    scene.scaleMode = SKSceneScaleModeFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end

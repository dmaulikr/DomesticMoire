
//  Created by Devine Lu Linvega on 2016-01-19.
//  Copyright © 2016 Devine Lu Linvega. All rights reserved.

#import "DomesticView.h"
#import "Domestic-Swift.h"

@implementation DomesticView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        self.spriteView = [[ScreenSaverSKView alloc] initWithFrame:self.frame];
        [self addSubview:self.spriteView];
        self.spriteView.ignoresSiblingOrder = true;
        self.spriteView.showsFPS = false;
        self.spriteView.showsNodeCount = false;
        self.spriteScene = [ScreenSaverScene new];
        self.spriteScene.size = self.frame.size;
        self.spriteScene.scaleMode = SKSceneScaleModeAspectFit;
        self.spriteScene.backgroundColor = [SKColor blackColor];
        [self.spriteView presentScene:self.spriteScene];
        
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

-(void)setFrame:(NSRect)frame
{
    [super setFrame:frame];
    self.spriteView.frame = self.frame;
    self.spriteScene.size = self.frame.size;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [super animateOneFrame];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end

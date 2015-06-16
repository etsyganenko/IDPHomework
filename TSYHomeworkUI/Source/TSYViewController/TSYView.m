//
//  TSYView.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

const NSUInteger TSYAnimationDuration   = 1;
const NSUInteger TSYAnimationDelay      = 0;
static BOOL TSYAnimationShouldStop      = NO;

@interface TSYView ()
@property (nonatomic, assign) TSYSquarePosition   position;

- (TSYSquarePosition)futurePosition;
- (TSYSquarePosition)randomFuturePosition;

- (CGRect)frameWithPosition:(TSYSquarePosition)position;

- (void)setButtonsEnabled:(BOOL)enabled;

@end

@implementation TSYView

@dynamic isMoving;

#pragma mark -
#pragma mark Public Methods

- (void)nextPosition {
    self.next.userInteractionEnabled = NO;
    
    [self setPosition:[self futurePosition] animated:YES];
}

- (void)randomPosition {
    self.random.userInteractionEnabled = NO;
    
    [self setPosition:[self randomFuturePosition] animated:YES];
}

- (void)startMoving {
    TSYAnimationShouldStop = NO;
    
    self.start.userInteractionEnabled = NO;
    
    void (^completion)(BOOL) = ^(BOOL finished){
        if (finished && !TSYAnimationShouldStop) {
            [self startMoving];
        }
    };
    
    [self setPosition:[self futurePosition]
             animated:YES
    completionHandler:completion];
}

- (void)stopMoving {
    TSYAnimationShouldStop = YES;
    
    [self setButtonsEnabled:YES];
}

- (void)setPosition:(TSYSquarePosition)position {
    [self setPosition:position animated:NO];
}

- (void)setPosition:(TSYSquarePosition)position animated:(BOOL)isAnimated {
    [self setPosition:position
             animated:isAnimated
    completionHandler:NULL];
}

- (void)setPosition:(TSYSquarePosition)position
           animated:(BOOL)isAnimated
  completionHandler:(void (^)(BOOL finished))handler
{
    if (_position != position) {
        [UIView animateWithDuration:TSYAnimationDuration
                              delay:TSYAnimationDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.square.frame = [self frameWithPosition:position];
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 _position = position;
                                 
                                 self.next.userInteractionEnabled = YES;
                                 self.random.userInteractionEnabled = YES;
                             }
                             
                             if (handler) {
                                 handler(finished);
                             }
                         }];
    }
}

- (BOOL)isMoving {
    return !TSYAnimationShouldStop;
}

#pragma mark -
#pragma mark Private Methods

// enable/disable all buttons except "Stop"
- (void)setButtonsEnabled:(BOOL)enabled {
    self.start.userInteractionEnabled = enabled;
    self.next.userInteractionEnabled = enabled;
    self.random.userInteractionEnabled = enabled;
}

- (CGRect)frameWithPosition:(TSYSquarePosition)position {
    CGRect windowFrame = self.bounds;
    CGRect squareFrame = self.square.frame;
    CGRect newFrame = squareFrame;
    
    CGFloat distanceX = windowFrame.size.width - squareFrame.size.width;
    CGFloat distanceY = windowFrame.size.height - squareFrame.size.height;
    
    CGPoint point = CGPointMake(windowFrame.origin.x,
                                 windowFrame.origin.y);
    
    switch (position) {
        case TSYSquarePositionLeftUp:
            break;
            
        case TSYSquarePositionRightUp:
            point.x += distanceX;
            break;
            
        case TSYSquarePositionRightDown:
            point.x += distanceX;
            point.y += distanceY;
            break;
            
        case TSYSquarePositionLeftDown:
            point.y += distanceY;
            break;
            
        default:
            break;
    }
    
    newFrame.origin = point;
    
    return newFrame;
}

- (TSYSquarePosition)futurePosition {
    return (self.position + 1) % TSYSquarePositionCount;
}

- (TSYSquarePosition)randomFuturePosition {
    TSYSquarePosition randomPosition = arc4random_uniform(TSYSquarePositionCount);
    
    if (randomPosition == self.position) {
        randomPosition = [self randomFuturePosition];
    }

    return randomPosition;
}

@end

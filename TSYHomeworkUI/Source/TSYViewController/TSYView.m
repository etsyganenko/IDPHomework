//
//  TSYView.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

const NSUInteger TSYViewAnimationDuration   = 1;
const NSUInteger TSYViewAnimationDelay      = 0;
static BOOL TSYViewAnimationShouldStop      = NO;

@interface TSYView ()
@property (nonatomic, assign) TSYSquarePosition   currentPosition;

- (TSYSquarePosition)nextPosition;
- (TSYSquarePosition)nextRandomPosition;

- (CGRect)frameWithPosition:(TSYSquarePosition)position;

- (void)setButtonsEnabled:(BOOL)enabled;

@end

@implementation TSYView

@dynamic isMoving;

#pragma mark -
#pragma mark Public Methods

- (void)moveToNextPosition {
    self.nextButton.userInteractionEnabled = NO;
    
    [self setPosition:[self nextPosition] animated:YES];
}

- (void)moveToRandomPosition {
    self.randomButton.userInteractionEnabled = NO;
    
    [self setPosition:[self nextRandomPosition] animated:YES];
}

- (void)startMoving {
    TSYViewAnimationShouldStop = NO;
    
    [self setButtonsEnabled:NO];
    
    [self setPosition:[self nextPosition]
             animated:YES
    completionHandler:^(BOOL finished){
        if (finished && !TSYViewAnimationShouldStop) {
            [self startMoving];
        }
    }];
    
//    void (^completion)(BOOL) = ^(BOOL finished){
//        if (finished && !TSYViewAnimationShouldStop) {
//            [self startMoving];
//        }
//    };
//    
//    [self setPosition:[self nextPosition]
//             animated:YES
//    completionHandler:completion];
}

- (void)stopMoving {
    TSYViewAnimationShouldStop = YES;
    
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
    if (_currentPosition != position) {
        [UIView animateWithDuration:TSYViewAnimationDuration
                              delay:TSYViewAnimationDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.squareLabel.frame = [self frameWithPosition:position];
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 _currentPosition = position;
                                 
                                 self.nextButton.userInteractionEnabled = YES;
                                 self.randomButton.userInteractionEnabled = YES;
                             }
                             
                             if (handler) {
                                 handler(finished);
                             }
                         }];
    }
}

- (BOOL)isMoving {
    return !TSYViewAnimationShouldStop;
}

#pragma mark -
#pragma mark Private Methods

// enable/disable all buttons except "Stop"
- (void)setButtonsEnabled:(BOOL)enabled {
    self.startButton.userInteractionEnabled = enabled;
    self.nextButton.userInteractionEnabled = enabled;
    self.randomButton.userInteractionEnabled = enabled;
}

- (CGRect)frameWithPosition:(TSYSquarePosition)position {
    CGRect windowFrame = self.bounds;
    CGRect squareFrame = self.squareLabel.frame;
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

- (TSYSquarePosition)nextPosition {
    return (self.currentPosition + 1) % TSYSquarePositionCount;
}

- (TSYSquarePosition)nextRandomPosition {
    TSYSquarePosition randomPosition = arc4random_uniform(TSYSquarePositionCount);
    
    if (randomPosition == self.currentPosition) {
        randomPosition = [self nextRandomPosition];
    }

    return randomPosition;
}

@end

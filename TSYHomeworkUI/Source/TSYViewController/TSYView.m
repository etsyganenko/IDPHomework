//
//  TSYView.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

static const NSUInteger TSYViewAnimationDuration   = 1;
static const NSUInteger TSYViewAnimationDelay      = 0;

@interface TSYView ()
@property (nonatomic, assign) BOOL  animationShouldStop;

- (TSYSquarePosition)nextPosition;
- (TSYSquarePosition)nextRandomPosition;

- (CGRect)frameWithPosition:(TSYSquarePosition)position;

@end

@implementation TSYView

@dynamic moving;

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
    self.startButton.userInteractionEnabled = NO;
    
    self.animationShouldStop = NO;
    
    [self setPosition:[self nextPosition]
             animated:YES
    completionHandler:^(BOOL finished){
        if (finished && !self.animationShouldStop) {
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
    self.startButton.userInteractionEnabled = YES;
    
    self.animationShouldStop = YES;
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
        [UIView animateWithDuration:isAnimated ? TSYViewAnimationDuration : 0
                              delay:isAnimated ? TSYViewAnimationDelay : 0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.squareLabel.frame = [self frameWithPosition:position];
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 _position = position;
                                 
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
    return !self.animationShouldStop;
}

#pragma mark -
#pragma mark Private Methods

- (CGRect)frameWithPosition:(TSYSquarePosition)position {
    CGRect frame = self.bounds;
    CGRect squareFrame = self.squareLabel.frame;
    
    CGFloat distanceX = CGRectGetWidth(frame) - CGRectGetWidth(squareFrame);
    CGFloat distanceY = CGRectGetHeight(frame) - CGRectGetHeight(squareFrame);
    
    CGPoint point = CGPointMake(CGRectGetMinX(frame),
                                CGRectGetMinY(frame));
    
    switch (position) {
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
    
    squareFrame.origin = point;
    
    return squareFrame;
}

- (TSYSquarePosition)nextPosition {
    return (self.position + 1) % TSYSquarePositionCount;
}

- (TSYSquarePosition)nextRandomPosition {
    TSYSquarePosition randomPosition = arc4random_uniform(TSYSquarePositionCount);
    
    while (self.position == randomPosition) {
        randomPosition = arc4random_uniform(TSYSquarePositionCount);
    }

    return randomPosition;
}

@end

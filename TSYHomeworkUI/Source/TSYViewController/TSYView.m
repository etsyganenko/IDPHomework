//
//  TSYView.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

@interface TSYView ()
@property (nonatomic, assign) TSYSquarePosition     position;
@property (nonatomic, strong) NSTimer               *timer;

- (TSYSquarePosition)futurePosition;
- (TSYSquarePosition)randomFuturePosition;

- (CGRect)frameWithPosition:(TSYSquarePosition)position;

- (void)setPosition:(TSYSquarePosition)position;
- (void)setPosition:(TSYSquarePosition)position animated:(BOOL)isAnimated;
- (void)setPosition:(TSYSquarePosition)position
           animated:(BOOL)isAnimated
  completionHandler:(void (^)(BOOL finished))handler;

@end

@implementation TSYView

#pragma mark -
#pragma mark Public Methods

- (void)nextPosition {
    [self setPosition:[self futurePosition] animated:NO];
}

- (void)randomPosition {
    [self setPosition:[self randomFuturePosition] animated:YES];
}

- (void)startMoving {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(moveWithTimer:)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void)stopMoving {
    [self.timer invalidate];
    
    self.timer = nil;
}

#pragma mark -
#pragma mark Private Methods

- (void)moveWithTimer:(NSTimer *)timer {
    self.start.userInteractionEnabled = NO;
    self.next.userInteractionEnabled = NO;
    self.random.userInteractionEnabled = NO;
    
    [self nextPosition];
}

- (void)setPosition:(TSYSquarePosition)position {
    [self setPosition:position animated:NO];
}

- (void)setPosition:(TSYSquarePosition)position animated:(BOOL)isAnimated {
    [self setPosition:position
             animated:isAnimated
    completionHandler:NULL];
    
//    [self setPosition:position
//             animated:isAnimated
//    completionHandler:^(BOOL finished) {
//        self.userInteractionEnabled = YES;
//    }];
}

- (void)setPosition:(TSYSquarePosition)position
           animated:(BOOL)isAnimated
  completionHandler:(void (^)(BOOL finished))handler
{
    if (_position != position) {
        self.userInteractionEnabled = NO;
        
        if (isAnimated) {
            [UIView animateWithDuration:1
                             animations:^{
                                 self.square.frame = [self frameWithPosition:position];
                             }
                             completion:handler];
            
        } else {
            self.square.frame = [self frameWithPosition:position];
        }
        
        _position = position;
        
        if (!handler) {
            self.userInteractionEnabled = YES;
        }
    }
}

- (CGRect)frameWithPosition:(TSYSquarePosition)position {
    CGRect windowFrame = self.window.bounds;
    CGRect squareFrame = self.square.frame;
    CGRect newFrame = squareFrame;
    
    CGFloat distanceX = windowFrame.size.width - squareFrame.size.width;
    CGFloat distanceY = windowFrame.size.height - squareFrame.size.height;
    
    switch (position) {
        case TSYSquarePositionLeftUp:
            newFrame.origin = CGPointMake(windowFrame.origin.x, windowFrame.origin.y);
            return newFrame;
            
        case TSYSquarePositionRightUp:
            newFrame.origin = CGPointMake(windowFrame.origin.x + distanceX, windowFrame.origin.y);
            return newFrame;
            
        case TSYSquarePositionRightDown:
            newFrame.origin = CGPointMake(windowFrame.origin.x + distanceX, windowFrame.origin.y + distanceY);
            return newFrame;
            
        case TSYSquarePositionLeftDown:
            newFrame.origin = CGPointMake(windowFrame.origin.x, windowFrame.origin.y + distanceY);
            return newFrame;
            
        default:
            return squareFrame;
    }
}

- (TSYSquarePosition)futurePosition {
    TSYSquarePosition currentPosition = self.position;
    
    if (TSYSquarePositionLeftDown == currentPosition) {
        return TSYSquarePositionLeftUp;
    }

    return currentPosition + 1;
}

- (TSYSquarePosition)randomFuturePosition {
    TSYSquarePosition randomPosition = arc4random_uniform(TSYSquarePositionLeftDown + 1);
    
    if (randomPosition == self.position) {
        randomPosition = [self randomFuturePosition];
    }

    return randomPosition;
}

@end

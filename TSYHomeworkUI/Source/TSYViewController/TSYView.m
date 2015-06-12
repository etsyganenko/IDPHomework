//
//  TSYView.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

@interface TSYView ()
@property (nonatomic, assign) TSYSquarePosition   position;

- (TSYSquarePosition)futurePosition;
- (TSYSquarePosition)randomFuturePosition;

- (CGRect)frameWithPosition:(TSYSquarePosition)position;

@end

@implementation TSYView

- (void)nextPosition {
    self.position = [self futurePosition];
}

- (void)randomPosition {
    self.position = [self randomFuturePosition];
}

- (void)setPosition:(TSYSquarePosition)position {
    if (_position != position) {
        CGRect frame = [self frameWithPosition:position];

//        [UIView animateWithDuration:1
//                         animations:^{
//                             self.square.frame = frame;
//                         }];
        
        self.userInteractionEnabled = NO;
        
        [UIView animateWithDuration:1
                         animations:^{
                             self.square.frame = frame;
                         }
                         completion:^(BOOL finished){
                                     self.userInteractionEnabled = YES;
                         }];

        _position = position;
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

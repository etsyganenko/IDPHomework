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

@end

@implementation TSYView

- (void)nextPosition {
    self.position = [self futurePosition];
}

- (void)randomPosition {
    self.square.backgroundColor = [UIColor greenColor];
}

- (void)setPosition:(TSYSquarePosition)position {
    if (_position != position) {
        CGRect newFrame = self.square.frame;
        
        CGFloat newFrameX = newFrame.origin.x;
        CGFloat newFrameY = newFrame.origin.y;
        
        CGFloat distanceX = self.window.bounds.size.width - self.square.frame.size.width;
        CGFloat distanceY = self.window.bounds.size.height - self.square.frame.size.height;
        
        if (TSYSquarePositionRightUp == position) {
            newFrame.origin = CGPointMake(distanceX, newFrameY);
        } else if (TSYSquarePositionRightDown == position) {
            newFrame.origin = CGPointMake(newFrameX, distanceY);
        } else if (TSYSquarePositionLeftDown == position) {
            newFrame.origin = CGPointMake(newFrameX-distanceX, newFrameY);
        } else if (TSYSquarePositionLeftUp == position) {
            newFrame.origin = CGPointMake(newFrameX, newFrameY-distanceY);
        }
        
        [UIView animateWithDuration:1
                         animations:^{
                             self.square.frame = newFrame;
                         }];
        
        _position = position;
    }
}

- (TSYSquarePosition)futurePosition {
    TSYSquarePosition currentPosition = self.position;
    
    if (TSYSquarePositionLeftDown == currentPosition) {
        return TSYSquarePositionLeftUp;
    }
    
    return currentPosition + 1;
}

@end

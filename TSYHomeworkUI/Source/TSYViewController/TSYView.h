//
//  TSYView.h
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TSYSquarePosition) {
    TSYSquarePositionLeftUp,
    TSYSquarePositionRightUp,
    TSYSquarePositionRightDown,
    TSYSquarePositionLeftDown,
    TSYSquarePositionCount
};

@interface TSYView : UIView
@property (nonatomic, strong)   IBOutlet UILabel    *squareLabel;

@property (nonatomic, readonly) TSYSquarePosition   currentPosition;
@property (nonatomic, readonly) BOOL                isMoving;

@property (nonatomic, strong)   IBOutlet UIButton   *nextButton;
@property (nonatomic, strong)   IBOutlet UIButton   *randomButton;

@property (nonatomic, strong)   IBOutlet UIButton   *startButton;
@property (nonatomic, strong)   IBOutlet UIButton   *stopButton;

- (void)moveToNextPosition;
- (void)moveToRandomPosition;

- (void)startMoving;
- (void)stopMoving;

- (void)setPosition:(TSYSquarePosition)position;
- (void)setPosition:(TSYSquarePosition)position animated:(BOOL)isAnimated;
- (void)setPosition:(TSYSquarePosition)position
           animated:(BOOL)isAnimated
  completionHandler:(void (^)(BOOL finished))handler;

@end

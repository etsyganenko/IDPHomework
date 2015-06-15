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
@property (nonatomic, strong)   IBOutlet UILabel    *square;

@property (nonatomic, readonly) TSYSquarePosition   position;
@property (nonatomic, readonly) BOOL                isMoving;

@property (nonatomic, strong)   IBOutlet UIButton   *next;
@property (nonatomic, strong)   IBOutlet UIButton   *random;

@property (nonatomic, strong)   IBOutlet UIButton   *start;
@property (nonatomic, strong)   IBOutlet UIButton   *stop;

- (void)nextPosition;
- (void)randomPosition;

- (void)startMoving;
- (void)stopMoving;

- (void)setPosition:(TSYSquarePosition)position;
- (void)setPosition:(TSYSquarePosition)position animated:(BOOL)isAnimated;
- (void)setPosition:(TSYSquarePosition)position
           animated:(BOOL)isAnimated
  completionHandler:(void (^)(BOOL finished))handler;

@end

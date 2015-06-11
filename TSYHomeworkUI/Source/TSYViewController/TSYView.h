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
    TSYSquarePositionLeftDown
};

@interface TSYView : UIView
@property (nonatomic, strong)   IBOutlet UILabel     *square;
@property (nonatomic, strong)   IBOutlet UIButton    *next;
@property (nonatomic, strong)   IBOutlet UIButton    *random;

- (void)nextPosition;
- (void)randomPosition;

@end

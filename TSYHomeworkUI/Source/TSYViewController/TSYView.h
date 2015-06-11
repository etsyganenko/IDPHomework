//
//  TSYView.h
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSYView : UIView
@property (nonatomic, retain)   IBOutlet UILabel     *square;
@property (nonatomic, retain)   IBOutlet UIButton    *next;
@property (nonatomic, retain)   IBOutlet UIButton    *random;

- (void)nextPosition;
- (void)randomPosition;

@end

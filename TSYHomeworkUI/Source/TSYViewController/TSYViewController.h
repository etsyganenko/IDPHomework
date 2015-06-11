//
//  TSYViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYView;

@interface TSYViewController : UIViewController
@property (nonatomic, retain)   TSYView  *mainView;

- (IBAction)onClickButtonNext:(id)sender;
- (IBAction)onClickButtonRandom:(id)sender;

@end

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
@property (nonatomic, readonly)   TSYView  *mainView;

- (IBAction)onButtonNext:(id)sender;
- (IBAction)onButtonRandom:(id)sender;

- (IBAction)onButtonStart:(id)sender;
- (IBAction)onButtonStop:(id)sender;

@end

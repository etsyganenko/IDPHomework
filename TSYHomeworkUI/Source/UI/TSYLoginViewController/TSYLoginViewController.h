//
//  TSYLoginViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

@class TSYFBUserModel;

@interface TSYLoginViewController : TSYViewController
@property (nonatomic, strong)   TSYFBUserModel  *model;

- (IBAction)onButtonLogin:(id)sender;
- (IBAction)onButtonShowUserProfile:(id)sender;

@end

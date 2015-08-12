//
//  TSYLoginViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

#import "TSYFBUserModel.h"

@class TSYFacebookLoginContext;
@class TSYFBUserModel;

@interface TSYLoginViewController : TSYViewController <TSYFBUserModelObserver>

- (IBAction)onLoginButton:(id)sender;
- (IBAction)onUserProfileButton:(id)sender;

@end

//
//  TSYUserDetailViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

#import "TSYFBUserModel.h"

@class TSYFacebookUserInfoContext;
@class TSYFBUserModel;

@interface TSYUserDetailViewController : TSYViewController <TSYFBUserModelObserver>

- (IBAction)onFriendsButton:(id)sender;

@end

//
//  TSYLoginView.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TSYView.h"

@class TSYFBUserModel;

@interface TSYLoginView : TSYView
@property (nonatomic, strong)   IBOutlet UIButton   *loginButton;
@property (nonatomic, strong)   IBOutlet UIButton   *showUserProfile;

@end

//
//  TSYLoginView.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TSYView.h"

@interface TSYLoginView : TSYView
@property (nonatomic, strong)   IBOutlet FBSDKLoginButton   *facebookLoginButton;

@property (nonatomic, strong)   IBOutlet UIButton           *loginButton;


@end

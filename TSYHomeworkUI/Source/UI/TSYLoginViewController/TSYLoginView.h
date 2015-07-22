//
//  TSYLoginView.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "TSYView.h"

@interface TSYLoginView : TSYView
@property (nonatomic, strong)   IBOutlet FBSDKLoginButton   *loginButton;

@end

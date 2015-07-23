//
//  TSYLoginContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYLoginContext.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation TSYLoginContext

- (void)execute {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    
    [loginManager logInWithReadPermissions:@[@"public_profile", @"user_friends"]
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
                                       if (error) {
                                           
                                       }
                                   }];
}

@end

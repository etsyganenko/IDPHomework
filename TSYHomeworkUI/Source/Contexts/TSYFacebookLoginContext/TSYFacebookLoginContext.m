//
//  TSYFacebookLoginContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYFacebookLoginContext.h"

#import "TSYFBUserModel.h"
#import "TSYMacros.h"

@interface TSYFacebookLoginContext ()
@property (nonatomic, strong)   FBSDKLoginManager   *loginManager;

@end

@implementation TSYFacebookLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Accessors

- (NSArray *)permissions {
    return @[@"public_profile", @"email", @"user_friends"];
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    self.loginManager = [FBSDKLoginManager new];
    
    TSYWeakify(self);
    [self.loginManager logInWithReadPermissions:self.permissions
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                       TSYStrongify(self);
                                       
                                       TSYFBUserModel *model = self.model;
                                       
                                       if (error || result.isCancelled) {
                                           model.state = TSYModelDidFailLoading;
                                           
                                           return;
                                       }
                                       
                                       [self fillModelWithResult:result];
                                       
                                       model.state = TSYModelDidLoad;
                                   }];
}

- (void)fillModelWithResult:(FBSDKLoginManagerLoginResult *)result {
    TSYFBUserModel *model = self.model;
    
    model.ID = result.token.userID;
}

@end

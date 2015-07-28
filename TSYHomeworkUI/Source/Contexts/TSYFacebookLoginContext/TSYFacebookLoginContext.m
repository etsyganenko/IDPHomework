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

@interface TSYFacebookLoginContext ()
@property (nonatomic, strong)   FBSDKLoginManager   *loginManager;

- (void)fillModelWithResult:(id)result;

@end

@implementation TSYFacebookLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Accessors

- (FBSDKLoginManager *)loginManager {
    return [FBSDKLoginManager new];
}

- (NSArray *)permissions {
    return @[@"public_profile", @"email", @"user_friends"];
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    FBSDKLoginManager *loginManager = self.loginManager;
    
    [loginManager logInWithReadPermissions:self.permissions
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
                                       if (error || result.isCancelled) {
                                           self.model.state = TSYModelDidFailLoading;
                                           
                                           return;
                                       }
                                       
                                       [self fillModelWithResult:result];
                                       
                                       self.model.state = TSYModelDidLoad;
                                   }];
}

#pragma mark -
#pragma mark Private Methods

- (void)fillModelWithResult:(FBSDKLoginManagerLoginResult *)result {
    ((TSYFBUserModel *)(self.model)).ID = result.token.userID;
}

@end

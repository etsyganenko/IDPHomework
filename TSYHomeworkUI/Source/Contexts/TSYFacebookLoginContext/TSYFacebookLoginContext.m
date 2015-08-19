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

#import "ActiveRecordKit.h"
#import "TSYFBUser.h"
#import "TSYMacros.h"
#import "TSYFacebookConstants.h"

@interface TSYFacebookLoginContext ()
@property (nonatomic, strong)   FBSDKLoginManager   *loginManager;

@end

@implementation TSYFacebookLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Accessors

- (NSArray *)permissions {
    return @[kReadPermissionPublicProfile, kReadPermissionEmail, kReadPermissionUserFriends, kReadPermissionUserPhotos];
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    self.loginManager = loginManager;
    
    TSYWeakify(self);
    [loginManager logInWithReadPermissions:self.permissions
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                       TSYStrongify(self);
                                       
                                       [self processRequestResult:result error:error];
                                   }];
}

- (void)processRequestResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (error || result.isCancelled) {
        self.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    self.state = TSYModelDidLoad;
}

- (void)fillModelWithResult:(FBSDKLoginManagerLoginResult *)result {
    NSString *userID = result.token.userID;
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ == %@", @"userID", userID];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id == %@", userID];
    
    NSArray *users = [TSYFBUser fetchEntityWithSortDescriptors:nil
                                                  predicate:predicate
                                              prefetchPaths:nil];
    
    if (0 == users.count) {
        TSYFBUser *user = [TSYFBUser managedObject];
        user.id = userID;
        
        self.model = user;
        
        [user saveManagedObject];
    } else {
        self.model = [users firstObject];
    }
    
//    TSYFBUserModel *userModel = [TSYFBUserModel new];
//    
//    userModel.userID = result.token.userID;
//    
//    self.model = userModel;
}

@end

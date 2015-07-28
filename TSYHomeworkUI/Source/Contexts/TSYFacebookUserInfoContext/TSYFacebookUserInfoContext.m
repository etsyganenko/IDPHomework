//
//  TSYFacebookUserInfoContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYFacebookUserInfoContext.h"

#import "TSYFBUserModel.h"
#import "TSYImageModel.h"

static NSString * const kGraphPath              = @"me?fields=name,picture{url}";
static NSString * const kUserNameKey            = @"name";

@implementation TSYFacebookUserInfoContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return kGraphPath;
}

#pragma mark -
#pragma mark Private Methods

- (void)fillModelWithResult:(id)result {
    ((TSYFBUserModel *)(self.model)).imageUrl = result[@"picture"][@"data"][@"url"];
    ((TSYFBUserModel *)(self.model)).name = result[kUserNameKey];
}

@end

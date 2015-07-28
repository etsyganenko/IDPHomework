//
//  TSYFacebookUserFriendsContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 28.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYFacebookUserFriendsContext.h"
#import "TSYArrayModel.h"

static NSString * const kGraphPath      = @"me?fields=friends";

@implementation TSYFacebookUserFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return kGraphPath;
}

#pragma mark -
#pragma mark Private Methods

- (void)fillModelWithResult:(id)result {
    
}

@end

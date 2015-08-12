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
#import "TSYFacebookConstants.h"

@implementation TSYFacebookUserInfoContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pictureSize = CGSizeMake(kUserInfoContextPictureWidth, kUserInfoContextPictureHeight);
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    CGSize pictureSize = self.pictureSize;
    
    NSUInteger pictureWidth = pictureSize.width;
    NSUInteger pictureHeight = pictureSize.height;

    return [NSString stringWithFormat:kUserInfoContextGraphPath, model.ID, pictureWidth, pictureHeight];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *model = self.model;
    
    model.imageUrl = [NSURL URLWithString:result[kPictureKey][kDataKey][kURLKey]];
    model.name = result[kNameKey];
}

- (void)processRequestResult:(id)result error:(NSError *)error {
    TSYFBUserModel *model = self.model;
    if (error) {
        model.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
//    model.state = TSYModelDidLoad;
    model.state = TSYFBUserModelDidLoadUserInfo;
}

@end

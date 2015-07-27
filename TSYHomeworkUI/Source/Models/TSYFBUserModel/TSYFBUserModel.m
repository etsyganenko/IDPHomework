//
//  TSYFBUserModel.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFBUserModel.h"

#import "TSYArrayModel.h"
#import "TSYImageModel.h"
#import "TSYFacebookUserInfoContext.h"

@implementation TSYFBUserModel

@dynamic fullName;

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (void)performLoading {
    TSYFacebookUserInfoContext *context = [TSYFacebookUserInfoContext loadingContextWithModel:self];
    
    [context execute];
}

@end

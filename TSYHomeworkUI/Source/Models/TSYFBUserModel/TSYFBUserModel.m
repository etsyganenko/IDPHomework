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

@dynamic imageModel;
@dynamic fullName;

#pragma mark -
#pragma mark Accessors

- (TSYImageModel *)imageModel {
    return [TSYImageModel imageModelWithURL:self.imageUrl];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

@end

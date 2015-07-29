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

@interface TSYFBUserModel ()
@property (nonatomic, strong)     TSYArrayModel   *friends;

@end

@implementation TSYFBUserModel

@dynamic imageModel;
@dynamic fullName;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.friends = [TSYArrayModel new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (TSYImageModel *)imageModel {
    NSURL *url = self.imageUrl;

    return url ? [TSYImageModel imageModelWithURL:url] : nil;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

@end

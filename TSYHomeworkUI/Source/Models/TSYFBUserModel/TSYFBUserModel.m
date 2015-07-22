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

@interface TSYFBUserModel ()
@property (nonatomic, assign)     NSUInteger      ID;
@property (nonatomic, strong)     TSYArrayModel   *friends;

@end

@implementation TSYFBUserModel

@dynamic fullName;

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

@end

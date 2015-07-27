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

static NSString * const kGraphPath      = @"me";
static NSString * const kUserNameKey    = @"name";

@interface TSYFacebookUserInfoContext ()
@property (nonatomic, strong)   FBSDKGraphRequest               *request;
@property (nonatomic, strong)   FBSDKGraphRequestConnection     *connection;

@property (nonatomic, readonly) NSString                        *graphPath;

- (void)fillModelWithResult:(id)result;

@end

@implementation TSYFacebookUserInfoContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)facebookUserInfoContextWithModel:(TSYFBUserModel *)model {
    return [[[self class] alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancel];
}

- (instancetype)initWithModel:(TSYFBUserModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath parameters:nil];
}

- (FBSDKGraphRequestConnection *)connection {
    return [FBSDKGraphRequestConnection new];
}

- (NSString *)graphPath {
    return [NSString stringWithString:kGraphPath];
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    TSYFBUserModel *model = self.model;
    
    FBSDKGraphRequest *request = self.request;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequestConnection *connection = self.connection;
        
        [connection addRequest:request
             completionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (error) {
                     model.state = TSYModelDidFailLoading;
                     
                     return;
                 }
                 
                 [self fillModelWithResult:result];
                 
                 model.state = TSYModelDidLoad;
             }];
        
        [connection start];
    }
}
            
- (void)cancel {
    [self.connection cancel];
}

#pragma mark -
#pragma mark Private Methods

- (void)fillModelWithResult:(id)result {
    self.model.name = result[kUserNameKey];
}

@end

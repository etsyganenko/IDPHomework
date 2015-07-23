//
//  TSYLoadingContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYLoadingContext.h"

#import "TSYFBUserModel.h"

@interface TSYLoadingContext ()
@property (nonatomic, strong)   TSYFBUserModel    *model;

- (void)fillModelWithResult:(id)result;

@end

@implementation TSYLoadingContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingContextWithModel:(TSYFBUserModel *)model {
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
#pragma mark Public Methods

- (void)execute {
    TSYFBUserModel *model = self.model;
    
    NSString *graphPath = @"";
    FBSDKGraphRequest *graphRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:graphPath parameters:nil];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [graphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (error) {
                 model.state = TSYModelDidFailLoading;
                 
                 return;
             }
             
             [self fillModelWithResult:result];
             
             model.state = TSYModelDidLoad;
         }];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)fillModelWithResult:(id)result {

}

@end

//
//  TSYLoadingContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYLoadingContext.h"

#import "TSYModel.h"

@interface TSYLoadingContext ()
@property (nonatomic, strong)   TSYModel    *model;

@end

@implementation TSYLoadingContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingContextWithModel:(TSYModel *)model {
    return [[[self class] alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancel];
}

- (instancetype)initWithModel:(TSYModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 
             }
         }];
    }
}

@end

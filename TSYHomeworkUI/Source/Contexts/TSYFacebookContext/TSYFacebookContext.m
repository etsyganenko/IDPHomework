//
//  TSYFacebookContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 28.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookContext.h"

#import "TSYMacros.h"
#import "TSYFBUserModel.h"

static NSString * const kHTTPMethod    = @"GET";

@interface TSYFacebookContext ()
@property (nonatomic, strong) FBSDKGraphRequest   *request;

@end

@implementation TSYFacebookContext

#pragma mark -
#pragma mark Public Methods

- (void)cancel {
    [self.connection cancel];
}

- (void)execute {
    if ([FBSDKAccessToken currentAccessToken]) {
        self.request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                                         parameters:nil
                                                         HTTPMethod:kHTTPMethod];
        
        self.connection = [self.request startWithCompletionHandler:[self completionHandler]];
    }
}

- (TSYContextCompletionHandler)completionHandler {
    TSYWeakify(self);
    TSYContextCompletionHandler handler = ^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        TSYStrongify(self);
        
        TSYFBUserModel *model = self.model;
        if (error) {
            model.state = TSYModelDidFailLoading;
            
            return;
        }
        
        [self fillModelWithResult:result];
        
        model.state = TSYModelDidLoad;
    };
    
    return handler;
}

@end

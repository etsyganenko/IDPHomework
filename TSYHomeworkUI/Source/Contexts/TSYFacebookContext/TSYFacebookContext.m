//
//  TSYFacebookContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 28.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookContext.h"

#import "TSYMacros.h"
#import "TSYModel.h"

@implementation TSYFacebookContext

#pragma mark -
#pragma mark Accessors

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                             parameters:nil
                                             HTTPMethod:@"GET"];
}

#pragma mark -
#pragma mark Public Methods

- (void)cancel {
    [self.connection cancel];
}

- (void)execute {
    FBSDKGraphRequest *request = self.request;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequestConnection *connection = [FBSDKGraphRequestConnection new];
        self.connection = connection;
        
        [request startWithCompletionHandler:[self completionHandler]];
    }
}

- (TSYContextCompletionHandler)completionHandler {
    TSYWeakify(self);
    TSYContextCompletionHandler handler = ^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        TSYStrongify(self);
        
        if (error) {
            self.model.state = TSYModelDidFailLoading;
            
            return;
        }
        
        [self fillModelWithResult:result];
        
        self.model.state = TSYModelDidLoad;
    };
    
    return handler;
}

@end

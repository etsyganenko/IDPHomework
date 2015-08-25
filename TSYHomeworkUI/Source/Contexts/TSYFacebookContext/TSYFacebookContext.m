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
#import "TSYFacebookConstants.h"

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
                                                         HTTPMethod:kRequestHTTPMethodGet];
        
        self.connection = [self.request startWithCompletionHandler:[self completionHandler]];
    }
}

- (TSYContextCompletionHandler)completionHandler {
    TSYWeakify(self);
    TSYContextCompletionHandler handler = ^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        TSYStrongify(self);
        
        [self processRequestResult:result error:error];
    };
    
    return handler;
}

- (void)processRequestResult:(id)result error:(NSError *)error {
    if (error) {
        self.state = TSYModelDidFailLoading;
        
        [self loadFromCache];
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    self.state = TSYModelDidLoad;
}

- (void)loadFromCache {
    self.state = TSYModelDidLoad;
}

@end

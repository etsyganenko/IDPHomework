//
//  TSYFacebookContext.h
//  TSYHomeworkUI
//
//  Created by Admin on 28.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYContext.h"

typedef void(^TSYContextCompletionHandler)(FBSDKGraphRequestConnection *connection, id result, NSError *error);

@interface TSYFacebookContext : TSYContext
@property (nonatomic, strong)   FBSDKGraphRequest               *request;
@property (nonatomic, strong)   FBSDKGraphRequestConnection     *connection;

@property (nonatomic, readonly) NSString                        *graphPath;

- (TSYContextCompletionHandler)completionHandler;

@end
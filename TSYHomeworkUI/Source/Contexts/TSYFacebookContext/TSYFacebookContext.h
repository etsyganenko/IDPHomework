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
@property (nonatomic, strong)   FBSDKGraphRequestConnection     *connection;

@property (nonatomic, readonly) FBSDKGraphRequest               *request;
@property (nonatomic, readonly) NSString                        *graphPath;

@property (nonatomic, assign)   CGSize                          pictureSize;

- (TSYContextCompletionHandler)completionHandler;

// this method must be overloaded in children
- (void)processRequestResult:(id)result error:(NSError *)error;

@end

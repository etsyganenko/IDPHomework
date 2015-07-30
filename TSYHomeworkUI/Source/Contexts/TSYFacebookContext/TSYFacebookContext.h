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

//@property (nonatomic, assign)   CGRect                          pictureSize;
//@property (nonatomic, assign)   NSDictionary                    *pictureSize;
@property (nonatomic, assign)   NSUInteger                      pictureHeight;
@property (nonatomic, assign)   NSUInteger                      pictureWidth;

- (TSYContextCompletionHandler)completionHandler;

@end

//
//  TSYLoginContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYLoginContext.h"

#import "TSYFBUserModel.h"

@interface TSYLoginContext ()
@property (nonatomic, strong)   FBSDKGraphRequestConnection     *connection;
@property (nonatomic, strong)   FBSDKGraphRequest               *request;
@property (nonatomic, readonly) NSArray                         *permissions;

- (void)fillModelWithResult:(id)result;

@end

@implementation TSYLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)logingContextWithModel:(TSYFBUserModel *)model {
    return [[self alloc] initWithModel:model];
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

- (NSArray *)permissions {
    return @[@"public_profile", @"user_friends"];
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    
    [loginManager logInWithReadPermissions:self.permissions
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
                                       if (error) {
                                           self.model.state = TSYModelDidFailLoading;
                                           
                                           return;
                                       }
                                       
                                       FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                                                                                      parameters:nil];
                                       self.request = request;
                                       
                                       if ([FBSDKAccessToken currentAccessToken]) {
                                           [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                               if (error) {
                                                   self.model.state = TSYModelDidFailLoading;
                                                   
                                                   return;
                                               }
                                               
                                               [self fillModelWithResult:result];
                                           }];
                                       }
                                       
                                       self.model.state = TSYModelDidLoad;
                                   }];
}

#pragma mark -
#pragma mark Private Methods

- (void)fillModelWithResult:(id)result {
    self.model.ID = result[@"id"];
    
    NSLog(@"login: ID: %@", result[@"id"]);
}

@end

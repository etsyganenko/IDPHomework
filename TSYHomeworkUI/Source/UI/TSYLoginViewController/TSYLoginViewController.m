//
//  TSYLoginViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYLoginViewController.h"

#import "TSYLoginView.h"
#import "TSYMacros.h"

TSYViewControllerBaseViewProperty(TSYLoginViewController, TSYLoginView, mainView)

@implementation TSYLoginViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onButtonLogin:(id)sender {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    
    [loginManager logInWithReadPermissions:@[@"public_profile", @"user_friends"]
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
                                       if (error) {
                                           
                                       }
                                   }];
}

@end

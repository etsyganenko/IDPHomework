//
//  TSYViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKLoginKit.h>
#import <FBSDKCoreKit.h>

#import "TSYViewController.h"

#import "TSYLoginViewController.h"
#import "TSYContext.h"
#import "TSYModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.context = nil;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:kLogoutButtonTitle
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(logout)];
    
    self.navigationController.navigationBar.topItem.rightBarButtonItem = button;
}

#pragma mark -
#pragma mark Accessors

- (void)setContext:(TSYContext *)context {
    if (_context != context) {
        [_context removeObserver:self];
        [_context cancel];
        
        _context = context;
        
        if (context) {
            [_context addObserver:self];
            [_context execute];
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)logout {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    
    [loginManager logOut];
    
//    UINavigationController *controller = self.navigationController;
    TSYLoginViewController *LoginViewController = [TSYLoginViewController new];
    
//    [controller pushViewController:LoginViewController animated:YES];
    
    LoginViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:LoginViewController animated:YES completion:nil];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidFailLoading:(TSYModel *)model {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:kAlertMessage
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:kAlertActionTitle
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:NO completion:nil];
}

@end

//
//  TSYAppDelegate.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYAppDelegate.h"

#import "ActiveRecordKit.h"
#import "TSYSquareViewController.h"
#import "TSYTableViewController.h"
#import "TSYLoginViewController.h"
#import "TSYUsers.h"
#import "TSYModel.h"
#import "TSYFBUserModel.h"
#import "TSYFacebookConstants.h"

#import "UIWindow+TSYCategories.h"

@interface TSYAppDelegate ()
@property (nonatomic, strong)   TSYUsers    *users;

@end

@implementation TSYAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL result  = [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    [IDPCoreDataManager sharedManagerWithMomName:kMOMName];
    
    TSYLoginViewController *loginViewController = [TSYLoginViewController new];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end

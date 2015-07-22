//
//  TSYAppDelegate.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYAppDelegate.h"

#import "TSYSquareViewController.h"
#import "TSYTableViewController.h"
#import "TSYLoginViewController.h"
#import "TSYUsers.h"

#import "UIWindow+TSYCategories.h"
#import "TSYModel.h"

@interface TSYAppDelegate ()
@property (nonatomic, strong)   TSYUsers    *users;

@end

@implementation TSYAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

//    window.rootViewController = [TSYSquareViewController new];
    TSYTableViewController *tableViewController = [TSYTableViewController new];
    TSYUsers *users = [TSYUsers new];
    
    TSYLoginViewController *loginViewController = [TSYLoginViewController new];
    
    self.users = users;
    
    tableViewController.users = users;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];

//    window.rootViewController = tableViewController;
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
//    return YES;
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                   didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //    [self.users save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //    [self.users save];
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

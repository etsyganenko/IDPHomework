//
//  TSYAppDelegate.m
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAppDelegate.h"

#import "TSYSquareViewController.h"
#import "TSYTableViewController.h"

#import "UIWindow+TSYCategories.h"

@interface TSYAppDelegate ()

@end

@implementation TSYAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

//    window.rootViewController = [TSYSquareViewController new];
    window.rootViewController = [TSYTableViewController new];
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end

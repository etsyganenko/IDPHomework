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
#import "TSYUsers.h"

#import "UIWindow+TSYCategories.h"
#import "TSYModel.h"

@interface TSYAppDelegate ()
@property (nonatomic, strong)   TSYModel    *model;

@end

@implementation TSYAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

//    window.rootViewController = [TSYSquareViewController new];
    TSYTableViewController *tableViewController = [TSYTableViewController new];
    TSYUsers *users = [TSYUsers users];
    
    self.model = users;
    
    tableViewController.users = users;
    
    window.rootViewController = tableViewController;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.model save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.model save];
}

@end

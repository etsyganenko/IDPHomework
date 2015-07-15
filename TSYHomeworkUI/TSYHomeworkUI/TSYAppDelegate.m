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
@property (nonatomic, strong)   TSYUsers    *users;

@end

@implementation TSYAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

//    window.rootViewController = [TSYSquareViewController new];
    TSYTableViewController *tableViewController = [TSYTableViewController new];
    TSYUsers *users = [TSYUsers new];
    
    self.users = users;
    
    tableViewController.users = users;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];

//    window.rootViewController = tableViewController;
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.users save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.users save];
}

@end

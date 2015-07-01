//
//  TSYAppDelegate.h
//  TSYHomeworkUI
//
//  Created by Admin on 11.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYModel;

@interface TSYAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong)   UIWindow  *window;
@property (nonatomic, readonly) TSYModel  *model;

@end

//
//  UIWindow+TSYCategories.m
//  TSYHomeworkUI
//
//  Created by Admin on 15.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "UIWindow+TSYCategories.h"

@implementation UIWindow (TSYCategories)

+ (instancetype)window {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end

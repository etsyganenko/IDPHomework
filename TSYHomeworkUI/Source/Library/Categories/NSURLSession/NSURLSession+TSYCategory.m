//
//  NSURLSession+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 18.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSURLSession+TSYCategory.h"

@implementation NSURLSession (TSYCategory)

+ (instancetype)sharedEphemeralSessionForClass:(Class)cls {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    return [self sharedSessionWithConfiguration:configuration forClass:cls];
}

+ (instancetype)sharedSessionWithConfiguration:(NSURLSessionConfiguration *)configuration
                                      forClass:(Class)cls
{
    NSURLSession *result = nil;
    
    static NSMapTable *mapTable = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        mapTable = [NSMapTable strongToStrongObjectsMapTable];
    });
    
    result = [mapTable objectForKey:cls];
    if (!result) {
        result = [NSURLSession sessionWithConfiguration:configuration];
        
        [mapTable setObject:result forKey:cls];
    }
    
    return result;
}

@end

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
    NSURLSession *result = nil;
    
    static NSMapTable *__mapTable = nil;
    static dispatch_once_t __onceToken;
    
    dispatch_once(&__onceToken, ^{
        __mapTable = [NSMapTable strongToStrongObjectsMapTable];
    });
    
    @synchronized (__mapTable) {
        result = [__mapTable objectForKey:cls];
        if (!result) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
            
            result = [NSURLSession sessionWithConfiguration:configuration];
            
            [__mapTable setObject:result forKey:cls];
        }
    }
    
    return result;
}

@end

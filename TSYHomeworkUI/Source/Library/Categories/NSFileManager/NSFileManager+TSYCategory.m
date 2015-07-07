//
//  NSFileManager+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 07.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSFileManager+TSYCategory.h"

@implementation NSFileManager (TSYCategory)

- (NSString *)DocumentDirectoryPath {
    return [self pathToDirectory:NSDocumentDirectory];
}

- (NSString *)pathToDirectory:(NSSearchPathDirectory)directory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
    
    return [paths firstObject];
}

@end

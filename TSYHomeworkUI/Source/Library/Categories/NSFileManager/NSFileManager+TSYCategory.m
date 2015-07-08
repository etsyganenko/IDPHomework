//
//  NSFileManager+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 07.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSFileManager+TSYCategory.h"

@implementation NSFileManager (TSYCategory)

+ (NSString *)documentDirectoryPath {
    return [self directoryPathWithType:NSDocumentDirectory];
}

+ (NSString *)directoryPathWithType:(NSSearchPathDirectory)type {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(type, NSUserDomainMask, YES);
    
    return [paths firstObject];
}

+ (NSString *)documentDirectoryFilePathWithFileName:(NSString *)fileName {
    return [NSFileManager filePathWithDirectoryType:NSDocumentDirectory
                                           fileName:fileName];
}

+ (NSString *)filePathWithDirectoryType:(NSSearchPathDirectory)directoryType
                               fileName:(NSString *)fileName
{
    NSString *directoryPath = [NSFileManager directoryPathWithType:directoryType];
    
    NSString *filePath = [directoryPath stringByAppendingPathComponent:fileName];
    
    return filePath;
}

@end

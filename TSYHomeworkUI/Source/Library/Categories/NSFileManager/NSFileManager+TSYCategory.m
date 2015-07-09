//
//  NSFileManager+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 07.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSFileManager+TSYCategory.h"

@implementation NSFileManager (TSYCategory)

+ (NSString *)documentsPath {
    return [self directoryPathWithType:NSDocumentDirectory];
}

+ (NSString *)documentsPathWithFileName:(NSString *)fileName {
    return [NSFileManager filePathWithDirectoryType:NSDocumentDirectory
                                           fileName:fileName];
}

+ (NSString *)directoryPathWithType:(NSSearchPathDirectory)type {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(type, NSUserDomainMask, YES);
    
    return [paths firstObject];
}

+ (NSString *)filePathWithDirectoryType:(NSSearchPathDirectory)directoryType
                               fileName:(NSString *)fileName
{
    NSString *directoryPath = [NSFileManager directoryPathWithType:directoryType];
    
    return [directoryPath stringByAppendingPathComponent:fileName];
}

@end

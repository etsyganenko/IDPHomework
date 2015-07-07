//
//  NSFileManager+TSYCategory.h
//  TSYHomeworkUI
//
//  Created by Admin on 07.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (TSYCategory)

+ (NSString *)documentDirectoryPath;
+ (NSString *)pathToDirectory:(NSSearchPathDirectory)directory;

@end

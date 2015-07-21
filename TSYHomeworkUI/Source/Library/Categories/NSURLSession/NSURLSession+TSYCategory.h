//
//  NSURLSession+TSYCategory.h
//  TSYHomeworkUI
//
//  Created by Admin on 18.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (TSYCategory)

+ (instancetype)sharedEphemeralSessionForClass:(Class)cls;

@end

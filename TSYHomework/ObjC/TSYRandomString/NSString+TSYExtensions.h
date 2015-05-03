//
//  NSString+TSYExtensions.h
//  TSYHomework
//
//  Created by Admin on 27.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSYExtensions)

// returns random string with random length
+ (instancetype)randomString;

// returns random string with given length
+ (instancetype)randomStringWithLength:(NSUInteger)length;

// returns random string with random length of characters from range
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;




@end

//Написать расширения для строки, которая бы генерировалась случайным образом.
//ТРебования:
//1. должна быть расширяемой
//2. должна быть удобной
//3. должна предоставлять возможность работать с разными наборами символов
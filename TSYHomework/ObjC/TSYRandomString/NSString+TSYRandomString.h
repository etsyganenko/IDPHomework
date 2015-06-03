//
//  NSString+TSYRandomString.h
//  TSYHomework
//
//  Created by Admin on 27.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSYRandomString)

// returns random string with random length limited by TSYMaxCharactersCount
+ (instancetype)randomString;

// returns random string with random length limited by TSYMaxCharactersCount
// with characters from a given range
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet;

// returns random string with given length
+ (instancetype)randomStringWithLength:(NSUInteger)length;

// returns random string with given length with characters from a given range
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end

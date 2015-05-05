//
//  NSString+TSYExtensions.m
//  TSYHomework
//
//  Created by Admin on 27.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSString+TSYExtensions.h"

#import "TSYAlphabet.h"

static const NSUInteger TSYCharactersLimit = 10;

@implementation NSString (TSYExtensions)

+ (instancetype)randomString {    
    return [self randomStringWithLength:arc4random_uniform(TSYCharactersLimit)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[TSYAlphabet alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(TSYAlphabet *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [(NSString *)alphabet length];
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar character = [(NSString *)alphabet characterAtIndex:arc4random_uniform((uint32_t)alphabetLength)];
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}


@end

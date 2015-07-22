//
//  NSString+TSYRandomString.m
//  TSYHomework
//
//  Created by Admin on 27.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSString+TSYRandomString.h"

#import "NSString+TSYAlphabet.h"

static const NSUInteger TSYMaxCharactersCount = 5;
static const NSUInteger TSYMinCharactersCount = 2;

@implementation NSString (TSYExtensions)

+ (instancetype)randomString {
    return [self randomStringWithAlphabet:[NSString alphanumericAlphabet]];
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet {
    NSUInteger length = TSYMinCharactersCount + arc4random_uniform(TSYMaxCharactersCount - TSYMinCharactersCount);
    
    return [self randomStringWithLength:length alphabet:alphabet];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[NSString alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar character = [alphabet characterAtIndex:arc4random_uniform((uint32_t)alphabetLength)];
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)randomStringWithLengthInRange:(NSRange)range {
    return [self randomStringWithLengthInRange:range alphabet:[NSString alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLengthInRange:(NSRange)range
                                     alphabet:(NSString *)alphabet {
    NSUInteger length = range.location + arc4random_uniform((u_int32_t)(range.length));
    
    return [self randomStringWithLength:length alphabet:alphabet];
}

@end

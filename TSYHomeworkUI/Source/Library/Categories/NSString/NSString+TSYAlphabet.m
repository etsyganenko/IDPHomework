//
//  NSString+TSYAlphabet.m
//  TSYHomework
//
//  Created by Admin on 03.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSString+TSYAlphabet.h"

@implementation NSString (TSYAlphabet)

+ (instancetype)letterAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self lowercaseLetterAlphabet]];
    [result appendString:[self capitalLetterAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithRange:NSMakeRange('0', 10)];
}

+ (instancetype)lowercaseLetterAlphabet {
    return [self alphabetWithRange:NSMakeRange('a', 26)];
}

+ (instancetype)capitalLetterAlphabet {
    return [self alphabetWithRange:NSMakeRange('A', 26)];
}

+ (instancetype)alphanumericAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self letterAlphabet]];
    
    [result appendString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)alphabetWithRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    unichar endOfRange = NSMaxRange(range);
    
    for (unichar character = range.location; character < endOfRange; character++) {
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

@end

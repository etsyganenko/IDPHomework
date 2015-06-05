//
//  NSString+TSYRandomCarNumber.m
//  TSYHomework
//
//  Created by Admin on 05.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSString+TSYRandomCarNumber.h"

#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

static const NSUInteger TSYCarNumberNumbersCount   = 4;
static const NSUInteger TSYCarNumberLettersCount   = 2;

@implementation NSString (TSYRandomCarNumber)

+ (instancetype)randomCarNumber {
    NSString *capitalLetterAlphabet = [NSString capitalLetterAlphabet];
    
    NSString *carNumber = [NSString randomStringWithLength:TSYCarNumberLettersCount
                                              alphabet:capitalLetterAlphabet];
    
    carNumber = [carNumber stringByAppendingString:[NSString randomStringWithLength:TSYCarNumberNumbersCount
                                                                   alphabet:[NSString numericAlphabet]]];
    
    carNumber = [carNumber stringByAppendingString:[NSString randomStringWithLength:TSYCarNumberLettersCount
                                                                   alphabet:capitalLetterAlphabet]];
    
    return carNumber;
}

@end

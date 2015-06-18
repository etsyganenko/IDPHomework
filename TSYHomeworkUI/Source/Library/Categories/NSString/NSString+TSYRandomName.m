//
//  NSString+TSYRandomName.m
//  TSYHomework
//
//  Created by Admin on 03.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSString+TSYRandomName.h"

#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

@implementation NSString (TSYRandomName)

+ (instancetype)randomName {
    return [[NSString randomStringWithAlphabet:[NSString lowercaseLetterAlphabet]] capitalizedString];
}

+ (instancetype)randomNameWithLength:(NSUInteger)length {
    return [[NSString randomStringWithLength:length
                                    alphabet:[NSString lowercaseLetterAlphabet]] capitalizedString];
}

+ (instancetype)randomNameWithLengthInRange:(NSRange)range {
    return [[NSString randomStringWithLengthInRange:range
                                           alphabet:[NSString lowercaseLetterAlphabet]] capitalizedString];
}

@end

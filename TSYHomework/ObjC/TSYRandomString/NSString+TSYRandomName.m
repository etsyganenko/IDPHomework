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
    return [[NSString randomStringWithAlphabet:[NSString letterAlphabet]] capitalizedString];
}

+ (instancetype)randomNameWithLength:(NSUInteger)length {
    return [[NSString randomStringWithLength:length
                                    alphabet:[NSString letterAlphabet]] capitalizedString];
}

+ (instancetype)randomNameWithMinLength:(NSUInteger)min
                              maxLength:(NSUInteger)max
{
    NSUInteger length = (min + arc4random_uniform((uint32_t)(max - min)));
    
    return [self randomNameWithLength:length];
}

@end

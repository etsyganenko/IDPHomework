//
//  NSString+TSYRandomCarNumber.h
//  TSYHomework
//
//  Created by Admin on 05.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSYRandomCarNumber)

// returns capitalized random string in format:
// TSYCarNumberNumbersCount letters,
// TSYCarNumberLettersCount numbers,
// TSYCarNumberNumbersCount letters
+ (instancetype)randomCarNumber;

@end

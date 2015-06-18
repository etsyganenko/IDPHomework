//
//  NSString+TSYAlphabet.h
//  TSYHomework
//
//  Created by Admin on 03.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSYAlphabet)

+ (instancetype)letterAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)capitalLetterAlphabet;
+ (instancetype)alphanumericAlphabet;
+ (instancetype)alphabetWithRange:(NSRange)range;

@end

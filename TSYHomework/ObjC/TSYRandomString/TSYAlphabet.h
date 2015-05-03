//
//  TSYAlphabet.h
//  TSYHomework
//
//  Created by Admin on 03.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYAlphabet : NSObject

+ (instancetype)letterAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)capitalLetterAlphabet;
+ (instancetype)alphanumericAlphabet;
+ (instancetype)alphabetWithRange:(NSRange)range;

@end

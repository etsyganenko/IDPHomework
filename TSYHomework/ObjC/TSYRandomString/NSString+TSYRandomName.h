//
//  NSString+TSYRandomName.h
//  TSYHomework
//
//  Created by Admin on 03.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSYRandomName)

// returns capitalized random string with random length
// from range [1 - 10]
+ (instancetype)randomName;

// returns capitalized random string with given length
+ (instancetype)randomNameWithLength:(NSUInteger)length;

// returns capitalized random string with random length
// with given min and max characters count
+ (instancetype)randomNameWithMinLength:(NSUInteger)min
                              maxLength:(NSUInteger)max;

@end

//
//  NSString+TSYRandomName.h
//  TSYHomework
//
//  Created by Admin on 03.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSYRandomName)

//returns capitalized random string with random length
//with min characters count = 2
//and max characters count = 5
+ (instancetype)randomName;

//returns capitalized random string with given length
+ (instancetype)randomNameWithLength:(NSUInteger)length;

//returns capitalized random string with random length
//with given min and max characters count
+ (instancetype)randomNameWithMinLength:(NSUInteger)min
                              maxLength:(NSUInteger)max;

@end

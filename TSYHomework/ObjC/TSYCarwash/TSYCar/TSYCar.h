//
//  TSYCar.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYCar : NSObject
@property (nonatomic, copy, readonly)           NSString    *model;
@property (nonatomic, assign)                   NSUInteger  money;
@property (nonatomic, assign, getter=isClean)   BOOL        clean;

+ (instancetype)carWithModel:(NSString *)model
                       money:(NSUInteger)money;

@end

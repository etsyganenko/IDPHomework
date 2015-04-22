//
//  TSYEmployee.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+TSYCategory.h"
#import "TSYGiveMoney.h"

@class TSYCar;

@interface TSYEmployee : NSObject<TSYGiveMoney>
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  salary;
@property (nonatomic, assign)   NSUInteger  experience;
@property (nonatomic, assign)   NSUInteger  money;

+ (instancetype)employeeWithName:(NSString *)name
                          salary:(NSUInteger)salary;

@end

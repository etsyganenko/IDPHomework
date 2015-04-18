//
//  TSYEmployee.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYEmployee : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  salary;

+ (instancetype)employeeWithName:(NSString *)name
                           salary:(NSUInteger)salary;

@end

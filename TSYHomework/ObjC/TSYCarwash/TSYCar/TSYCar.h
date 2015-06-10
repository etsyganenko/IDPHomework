//
//  TSYCar.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYMoneyProtocol.h"

@interface TSYCar : NSObject<TSYMoneyProtocol>
@property (nonatomic, copy, readonly)           NSString    *carNumber;
@property (nonatomic, assign)                   NSUInteger  money;
@property (nonatomic, assign, getter=isClean)   BOOL        clean;

+ (instancetype)carWithCarNumber:(NSString *)carNumber
                       money:(NSUInteger)money;

@end

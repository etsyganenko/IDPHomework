//
//  TSYWasher.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"
#import "TSYCar.h"

@class TSYAccountant;

@interface TSYWasher : TSYEmployee
@property (nonatomic, assign) NSUInteger    price;
@property (nonatomic, assign) TSYAccountant *accountant;

- (void)wash:(TSYCar *)car;
- (void)takeMoneyForWashing:(NSUInteger)money;
- (void)giveMoneyToAccountant:(NSUInteger)money;

@end

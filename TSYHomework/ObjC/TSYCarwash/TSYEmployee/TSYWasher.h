//
//  TSYWasher.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"

@class TSYCar;

@interface TSYWasher : TSYEmployee<TSYObserver>
@property (nonatomic, assign)   NSUInteger  price;

@end

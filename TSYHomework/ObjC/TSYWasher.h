//
//  TSYWasher.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"
#import "TSYCar.h"

@interface TSYWasher : TSYEmployee
@property (nonatomic, assign) NSUInteger price;

- (void)wash:(TSYCar *)car;

@end

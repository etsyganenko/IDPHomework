//
//  TSYEnterprise.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSYCar;

@interface TSYEnterprise : NSObject

+ (instancetype)enterprise;

- (void)runCarwash:(TSYCar *)car;

@end

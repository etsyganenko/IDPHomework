//
//  TSYDirector.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYDirector.h"

@implementation TSYDirector

- (void)earnProfit {
    NSLog(@"Earning profit...");
}

- (void)takeMoneyFromAccountant:(NSUInteger)money {
    self.money += money;
    
    [self earnProfit];
}

@end
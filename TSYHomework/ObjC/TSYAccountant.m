//
//  TSYAccountant.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAccountant.h"
#import "TSYDirector.h"

@implementation TSYAccountant

- (void)calculate:(NSUInteger)money {
    NSLog(@"Calculating...");
}

- (void)takeMoneyFromWasher:(NSUInteger)money {
    self.money += money;
    
    [self calculate:money];
}

- (void)giveMoneyToDirector:(NSUInteger)money {
    self.money -= money;
    
    [self.director takeMoneyFromAccountant:money];
}

@end

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

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.director = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public Methods

- (void)calculateMoney:(NSUInteger)money {
    NSLog(@"Calculating...");
}

- (void)takeMoneyFromWasher:(NSUInteger)money {
    self.money += money;
    
    [self calculateMoney:money];
}

- (void)giveMoneyToDirector:(NSUInteger)money {
    self.money -= money;
    
    [self.director takeMoneyFromAccountant:money];
}

@end

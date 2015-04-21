//
//  TSYAccountant.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"

@class TSYDirector;

@interface TSYAccountant : TSYEmployee
@property (nonatomic, assign) TSYDirector *director;

- (void)calculate:(NSUInteger)money;
- (void)takeMoneyFromWasher:(NSUInteger)money;
- (void)giveMoneyToDirector:(NSUInteger)money;

@end

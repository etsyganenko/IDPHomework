//
//  TSYCarGenerator.m
//  TSYHomework
//
//  Created by Admin on 05.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCarGenerator.h"

#import "TSYEnterprise.h"
#import "TSYCar.h"
#import "TSYQueue.h"

#import "NSString+TSYRandomCarNumber.h"
#import "NSObject+TSYCategory.h"

static const float TSYTimerInterval    = 0.3f;

@interface TSYCarGenerator ()
@property (nonatomic, retain)   NSTimer         *timer;
@property (nonatomic, retain)   TSYEnterprise   *enterprise;
@property (nonatomic, assign)   NSUInteger      capacity;
@property (nonatomic, assign)   NSUInteger      money;

- (void)washGeneratedCarsWithTimer:(NSTimer *)timer;

@end

@implementation TSYCarGenerator

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carGeneratorForEnterprise:(TSYEnterprise *)enterprise
                                withMoney:(NSUInteger)money
                                 capacity:(NSUInteger)capacity
{
    
    TSYCarGenerator *carGenerator = [self object];
    
    carGenerator.enterprise = enterprise;
    carGenerator.capacity = capacity;
    carGenerator.money = money;
    
    return carGenerator;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:TSYTimerInterval
                                                      target:self
                                                    selector:@selector(washGeneratedCarsWithTimer:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)start {
    [self.timer fire];
}

- (void)stop {
    [self.timer invalidate];
}

#pragma mark -
#pragma mark Private Methods

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        if ([_timer isValid]) {
            [_timer invalidate];
        }
        
        [_timer release];
        
        _timer = timer;
        
        [timer retain];
    }
}

- (void)washGeneratedCarsWithTimer:(NSTimer *)timer {
    TSYEnterprise *enterprise = self.enterprise;
    NSUInteger capacity = self.capacity;
    NSUInteger money = self.money;
    
    for (NSUInteger index = 0; index < capacity; index++) {
        TSYCar *car = [TSYCar carWithCarNumber:[NSString randomCarNumber] money:money];
//        [enterprise washCar:car];
        [enterprise performSelectorInBackground:@selector(washCar:) withObject:car];
    }
}

@end

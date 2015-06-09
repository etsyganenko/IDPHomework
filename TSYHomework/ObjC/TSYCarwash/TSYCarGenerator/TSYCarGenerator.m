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

static const float TSYTimerInterval     = 0.5f;

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
    return [[[self alloc] initWithEnterprise:enterprise
                                       Money:money
                                    capacity:capacity] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)initWithEnterprise:(TSYEnterprise *)enterprise
                             Money:(NSUInteger)money
                          capacity:(NSUInteger)capacity {
    self = [super init];
    if (self) {
        self.enterprise = enterprise;
        self.capacity = capacity;
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)start {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:TSYTimerInterval
                                                  target:self
                                                selector:@selector(washGeneratedCarsWithTimer:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stop {
    self.timer = nil;
}

#pragma mark -
#pragma mark Private Methods

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        if ([_timer isValid]) {
            [_timer invalidate];
        }
        
        [_timer release];
        
        _timer = [timer retain];
    }
}

- (void)washGeneratedCarsWithTimer:(NSTimer *)timer {
    TSYEnterprise *enterprise = self.enterprise;
    NSUInteger capacity = self.capacity;
    NSUInteger money = self.money;
    
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    
//    dispatch_apply(capacity, dispatch_get_main_queue(), ^(size_t index){
//        TSYCar *car = [TSYCar carWithCarNumber:[NSString randomCarNumber] money:money];
//        
//        dispatch_async(queue, ^{
//            [enterprise washCar:car];
//        });
//    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_apply(capacity, queue, ^(size_t index){
            TSYCar *car = [TSYCar carWithCarNumber:[NSString randomCarNumber] money:money];
            
            [enterprise washCar:car];
        });
    });
}

@end

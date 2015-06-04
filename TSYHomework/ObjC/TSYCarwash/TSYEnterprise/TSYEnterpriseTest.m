//
//  TSYEnterpriseTest.m
//  TSYHomework
//
//  Created by Admin on 22.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEnterpriseTest.h"
#import "TSYEnterprise.h"
#import "TSYCar.h"
#import "TSYDispatcher.h"

#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

static const NSUInteger TSYCarsCount        =   100;
static const NSUInteger TSYCarMoney         =   100;
static const NSUInteger TSYCarNameNumberCount    =   4;
static const NSUInteger TSYCarNameLetterCount    =   2;

void TSYEnterprisePerformTest() {
    @autoreleasepool {
        TSYEnterprise *enterprise = [TSYEnterprise enterprise];
        
        NSMutableArray *cars = [NSMutableArray array];
        
        NSString *capitalLetterAlphabet = [NSString capitalLetterAlphabet];
        NSString *numericAlphabet = [NSString numericAlphabet];
        
        for (NSUInteger index = 0; index < TSYCarsCount; index++) {
            NSString *model = [NSString randomStringWithLength:TSYCarNameLetterCount
                                                      alphabet:capitalLetterAlphabet];
            
            model = [model stringByAppendingString:[NSString randomStringWithLength:TSYCarNameNumberCount
                                                                           alphabet:numericAlphabet]];
            
            model = [model stringByAppendingString:[NSString randomStringWithLength:TSYCarNameLetterCount
                                                                        alphabet:capitalLetterAlphabet]];

            [cars addObject:[TSYCar carWithModel:model money:TSYCarMoney]];
        }
        
        for (TSYCar *car in cars) {
//            [enterprise washCar:car];
            
            usleep(arc4random_uniform(1000));
            
            [enterprise performSelectorInBackground:@selector(washCar:) withObject:car];
        }
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
    }
}

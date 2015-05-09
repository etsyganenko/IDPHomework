//
//  main.m
//  ObjC
//
//  Created by Admin on 10.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYCreatureTest.h"
#import "TSYCreature2Test.h"
#import "TSYEnterpriseTest.h"
#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        typedef NSString *(^TSYBlock)();
//        typedef void(^TSYBlock1)(NSUInteger value);
//        
//        __block NSUInteger staticValue = 0;
//        NSUInteger value1 = 0;
//        
//        TSYBlock block1 = ^() {
//            NSString *result = @"Block!!!";
//            
//            return result;
//        };
//        
//        TSYBlock1 block2 = ^(NSUInteger value) {
//            value += 1;
//            staticValue += 1;
//            NSLog(@"Block2 with value = %lu", staticValue);
//        };
//        
////        NSLog(@"%@", block1());
//        block2(42);
//        block2(42);
//        NSLog(@"staticValue = %lu", staticValue);
        
        TSYEnterprisePerformTest();
        
//        TSYCreaturePerformTest();

//        TSYCreature2PerformTest();
    }
    
    return 0;
}

//
//  TSYCreatureFemale.m
//  TSYHomework
//
//  Created by Admin on 12.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreatureFemale.h"

@implementation TSYCreatureFemale

#pragma mark -
#pragma mark Public Methods

- (TSYCreature *)giveBirth {
    TSYCreature *child = [TSYCreature creature];
    
    NSLog(@"New creature was born by %@", self.name);
    
    return child;
}

- (void)performGenderSpecificOperation {
    [self giveBirth];
}

@end

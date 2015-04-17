//
//  TSYCreatureMale.m
//  TSYHomework
//
//  Created by Admin on 12.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreatureMale.h"

@implementation TSYCreatureMale

#pragma mark -
#pragma mark Public Methods

- (void)fight {
    NSLog(@"%@, you're in the army now!", self.name);
}

- (void)performGenderSpecificOperation {
    [self fight];
}

@end

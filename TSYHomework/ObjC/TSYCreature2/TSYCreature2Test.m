//
//  TSYCreature2Test.m
//  TSYHomework
//
//  Created by Admin on 12.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreature2Test.h"

@implementation TSYCreature2Test

void TSYCreature2PerformTest() {
    TSYCreature2 *creature1 = [TSYCreatureMale creatureWithName:@"Ivan"];
    TSYCreature2 *creature2 = [TSYCreatureMale creatureWithName:@"Petr"];
    TSYCreature2 *creature3 = [TSYCreatureFemale creatureWithName:@"Olya"];
    TSYCreature2 *creature4 = [TSYCreatureFemale creatureWithName:@"Lena"];
    
    NSArray *creatures = [NSArray arrayWithObjects:creature1, creature2, creature3, creature4, nil];
    
    for (TSYCreature2 *creature in creatures) {
        [creature performGenderSpecificOperation];
    }
}

@end

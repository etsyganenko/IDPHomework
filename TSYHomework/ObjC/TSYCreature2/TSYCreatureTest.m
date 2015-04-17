//
//  TSYCreatureTest.m
//  TSYHomework
//
//  Created by Admin on 12.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreatureTest.h"

@implementation TSYCreatureTest

void TSYCreaturePerformTest() {
    TSYCreature *creature1 = [TSYCreatureMale creatureWithName:@"Ivan"];
    TSYCreature *creature2 = [TSYCreatureMale creatureWithName:@"Petr"];
    TSYCreature *creature3 = [TSYCreatureFemale creatureWithName:@"Olya"];
    TSYCreature *creature4 = [TSYCreatureFemale creatureWithName:@"Lena"];
    
    NSArray *creatures = [NSArray arrayWithObjects:creature1, creature2, creature3, creature4, nil];
    
    for (TSYCreature *creature in creatures) {
        [creature performGenderSpecificOperation];
    }
}

@end

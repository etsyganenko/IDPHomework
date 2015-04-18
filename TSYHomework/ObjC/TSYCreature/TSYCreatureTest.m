//
//  TSYCreatureTest.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreatureTest.h"

@implementation TSYCreatureTest

void TSYCreaturePerformTest() {
    TSYCreature *creature1 = [TSYCreature creatureWithName:@"Ivan" gender:TSYGenderMale];
    TSYCreature *creature2 = [TSYCreature creatureWithName:@"Petr" gender:TSYGenderMale];
    TSYCreature *creature3 = [TSYCreature creatureWithName:@"Olya" gender:TSYGenderFemale];
    TSYCreature *creature4 = [TSYCreature creatureWithName:@"Lena" gender:TSYGenderFemale];
    
    NSArray *creatures = [NSArray arrayWithObjects:creature1, creature2, creature3, creature4, nil];
    
    for (TSYCreature *creature in creatures) {
        if (TSYGenderMale == creature.gender) {
            [creature fight];
        } else if (TSYGenderFemale == creature.gender) {
            [creature giveBirth];
        }
    }
    
    [creature1 addChild:creature2];
    [creature2 addChild:creature3];
    
    [creature1 sayHi];
}

@end

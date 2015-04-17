//
//  TSYHuman.h
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYHuman__
#define __TSYHomework__TSYHuman__

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "TSYObject.h"
#include "TSYString.h"
#include "TSYArray.h"
#include "TSYPropertySet.h"

typedef struct TSYHuman TSYHuman;

typedef enum {
    TSYGenderNone,
    TSYGenderMale,
    TSYGenderFemale
} TSYGender;

struct TSYHuman {
    TSYObject _object;
    
    TSYHuman *_partner;
    TSYHuman *_mother;
    TSYHuman *_father;
    
    TSYArray *_children;
    
    TSYString *_name;
    
    TSYGender _gender;
    
    uint8_t _age;
};

extern
TSYHuman *TSYHumanCreate();

extern
void TSYHumanSetName(TSYHuman *human, TSYString *name);

extern
TSYString *TSYHumanGetName(TSYHuman *human);

extern
void TSYHumanSetAge(TSYHuman *human, uint8_t age);

extern
uint8_t TSYHumanGetAge(TSYHuman *human);

extern
void TSYHumanSetGender(TSYHuman *human, TSYGender gender);

extern
TSYGender TSYHumanGetGender(TSYHuman *human);

extern
bool TSYHumanIsMarried(TSYHuman *human);

extern
TSYHuman *TSYHumanGetPartner(TSYHuman *human);

extern
TSYHuman *TSYHumanGetMother(TSYHuman *human);

extern
TSYHuman *TSYHumanGetFather(TSYHuman *human);

extern
TSYArray *TSYHumanGetChildren(TSYHuman *human);

extern
uint8_t TSYHumanGetIndexOfChild(TSYHuman *human, TSYHuman *child);

extern
void TSYHumanMarry(TSYHuman *ivan, TSYHuman *human2);

extern
void TSYHumanDivorce(TSYHuman *ivan);

extern
void *TSYHumanGiveBirth(TSYHuman *human);

extern
void TSYHumanAddChild(TSYHuman *human, TSYHuman *child);

extern
void TSYHumanRemoveChild(TSYHuman *human, TSYHuman *child);

extern
void TSYHumanRemoveAllChildren(TSYHuman *human);

extern
void __TSYHumanDeallocate(TSYHuman *human);

#endif /* defined(__Human__TSYHuman__) */

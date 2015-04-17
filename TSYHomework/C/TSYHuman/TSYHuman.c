//
//  TSYHuman.c
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYHuman.h"

#pragma mark -
#pragma mark Private Declarations

static
void TSYHumanSetPartner(TSYHuman *human, TSYHuman *partner);

static
void TSYHumanSetMother(TSYHuman *human, TSYHuman *mother);

static
void TSYHumanSetFather(TSYHuman *human, TSYHuman *father);

static
void TSYHumanSetChildren(TSYHuman *human, TSYArray *array);

TSYHuman *TSYHumanGetChildAtIndex(TSYHuman *human, uint8_t index);

#pragma mark -
#pragma mark Public Implementations

TSYHuman *TSYHumanCreate() {
//    TSYHuman *human = TSYObjectCreate(sizeof(*human), &TSYHumanDeallocate);
    
    TSYHuman *human = TSYObjectCreate(TSYHuman);
    
    TSYArray *children = TSYArrayCreate();
    TSYHumanSetChildren(human, children);
    TSYObjectRelease(children);
    
    return human;
}

TSYString *TSYHumanGetName(TSYHuman *human) {
    return (NULL != human) ? human->_name : NULL;
}

void TSYHumanSetName(TSYHuman *human, TSYString *name) {
    if (NULL == human) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&(human->_name), name);
}

uint8_t TSYHumanGetAge(TSYHuman *human) {
    return (NULL != human) ? human->_age : 0;
}

void TSYHumanSetAge(TSYHuman *human, uint8_t age) {
    if (NULL != human && human->_age != age) {
        human->_age = age;
    }
}

TSYGender TSYHumanGetGender(TSYHuman *human) {
    return (NULL != human) ? human->_gender : TSYGenderNone;
}

void TSYHumanSetGender(TSYHuman *human, TSYGender gender) {
    if (NULL != human && human->_gender != gender) {
        human->_gender = gender;
    }
}

bool TSYHumanIsMarried(TSYHuman *human) {
    return (NULL != human) && (NULL != human->_partner);
}

TSYHuman *TSYHumanGetPartner(TSYHuman *human) {
    return (NULL != human) ? human->_partner : NULL;
}

TSYHuman *TSYHumanGetMother(TSYHuman *human) {
    return (NULL != human) ? human->_mother : NULL;
}

TSYHuman *TSYHumanGetFather(TSYHuman *human) {
    return (NULL != human) ? human->_father : NULL;
}

TSYArray *TSYHumanGetChildren(TSYHuman *human) {
    return (NULL != human) ? human->_children : NULL;
}

uint8_t TSYHumanGetIndexOfChild(TSYHuman *human, TSYHuman *child) {
    return (NULL != human && NULL != child) ? TSYArrayGetIndexOfObject(human->_children, child) : TSYObjectNotFound;
}

void TSYHumanMarry(TSYHuman *human1, TSYHuman *human2) {
    if (NULL == human1 || NULL == human2 || human1 == human2 ||
        TSYHumanGetGender(human1) == TSYHumanGetGender(human2)) {
        return;
    }
    
    TSYHumanDivorce(human1);
    TSYHumanDivorce(human2);
        
    TSYHumanSetPartner(human1, human2);
    TSYHumanSetPartner(human2, human1);
}

void TSYHumanDivorce(TSYHuman *human) {
    if (NULL == human) {
        return;
    }
    
    TSYHumanSetPartner(TSYHumanGetPartner(human), NULL);
    TSYHumanSetPartner(human, NULL);
}

void *TSYHumanGiveBirth(TSYHuman *human) {
    if (NULL == human) {
        return NULL;
    }
    
    TSYHuman *child = TSYHumanCreate();
        
    TSYHumanAddChild(human, child);
    TSYHumanAddChild(human->_partner, child);
        
    TSYObjectRelease(child);

    return child;
}

void TSYHumanAddChild(TSYHuman *human, TSYHuman *child) {
    if (NULL != human && NULL != child) {
        TSYArrayAddObject(human->_children, child);
        
        if (TSYGenderMale == TSYHumanGetGender(human)) {
            TSYHumanSetFather(child, human);
        } else {
            TSYHumanSetMother(child, human);
        }
    }
}

void TSYHumanRemoveChild(TSYHuman *human, TSYHuman *child) {
    if (NULL != human && NULL != child && TSYArrayContainsObject(human->_children, child)) {
        if (TSYGenderFemale == TSYHumanGetGender(human)) {
            TSYHumanSetMother(child, NULL);
        } else {
            TSYHumanSetFather(child, NULL);
        }
        
        TSYArrayRemoveObject(human->_children, child);
    }
}

TSYHuman *TSYHumanGetChildAtIndex(TSYHuman *human, uint8_t index) {
    return (NULL != human) ? TSYArrayGetObjectAtIndex(human->_children, index) : NULL;
}

void TSYHumanRemoveAllChildren(TSYHuman *human) {
    if (NULL != human) {
        for (int8_t iter = TSYArrayGetCount(TSYHumanGetChildren(human)) - 1; iter >= 0; iter--) {
            TSYHumanRemoveChild(human, TSYHumanGetChildAtIndex(human, iter));
        }
        
//        for (int8_t iter = 0; iter < TSYArrayGetCount(TSYHumanGetChildren(human)); iter++) {
//            TSYHumanRemoveChild(human, TSYHumanGetChildAtIndex(human, iter));
//        }
    }
}

void __TSYHumanDeallocate(TSYHuman *human) {
    TSYHumanSetFather(human, NULL);
    TSYHumanSetMother(human, NULL);
    TSYHumanSetPartner(human, NULL);
    TSYHumanSetName(human, NULL);
    
    TSYHumanRemoveAllChildren(human);
    TSYHumanSetChildren(human, NULL);
    
    __TSYObjectDeallocate(human);
}

#pragma mark -
#pragma mark Private Implementations

void TSYHumanSetPartner(TSYHuman *human, TSYHuman *partner) {
    if (NULL == human || human == partner) {
        return;
    }
    
    if (TSYGenderMale == TSYHumanGetGender(human)) {
        TSYPropertyRetainSet((void **)&(human->_partner), partner);
    } else {
        TSYPropertyAssignSet((void **)&(human->_partner), partner);
    }
}

void TSYHumanSetMother(TSYHuman *human, TSYHuman *mother) {
    if (NULL == human) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&(human->_mother), mother);
}

void TSYHumanSetFather(TSYHuman *human, TSYHuman *father) {
    if (NULL == human) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&(human->_father), father);
}

void TSYHumanSetChildren(TSYHuman *human, TSYArray *array) {
    if (NULL == human) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&(human->_children), array);
}

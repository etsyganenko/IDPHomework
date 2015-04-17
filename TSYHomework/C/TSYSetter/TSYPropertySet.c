//
//  TSYSetter.c
//  TSYHomework
//
//  Created by Admin on 12.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYPropertySet.h"
#include "TSYObject.h"

void TSYPropertyRetainSet(void **property, void *value) {
    if (*property != value) {
        if (NULL != value) {
            TSYObjectRetain(value);
        }
        
        if (NULL != *property) {
            TSYObjectRelease(*property);
        }
        
        *property = value;
    }
}

void TSYPropertyAssignSet(void **property, void *value) {
    *property = value;
}

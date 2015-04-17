//
//  TSYString.h
//  TSYHomework
//
//  Created by Admin on 28.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYString__
#define __TSYHomework__TSYString__

#include <stdio.h>
#include <assert.h>
#include "TSYObject.h"

struct TSYString {    
    TSYObject _object;
    
    char *_data;
    uint64_t _length;
};
typedef struct TSYString TSYString;

extern
TSYString *TSYStringCreate(char *data);

extern
char *TSYStringGetData(TSYString *string);

extern
void TSYStringSetData(TSYString *string, char *data);

extern
uint64_t TSYStringGetLength(TSYString *string);

extern
void __TSYStringDeallocate(TSYString *string);

#endif /* defined(__TSYHomework__TSYString__) */

//
//  TSYString.c
//  TSYHomework
//
//  Created by Admin on 28.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYString.h"
#include "string.h"

#pragma mark -
#pragma mark Private Declarations

void TSYStringSetLength(TSYString *string, uint64_t newLength);

#pragma mark -
#pragma mark Public Implementations

TSYString *TSYStringCreate(char *data) {
//    TSYString *string = TSYObjectCreate(sizeof(*string), &TSYStringDeallocate);
    
    TSYString *string = TSYObjectCreate(TSYString);
    
    TSYStringSetData(string, data);
    
    return string;
}

char *TSYStringGetData(TSYString *string) {
    return (NULL != string) ? string->_data : NULL;
}

uint64_t TSYStringGetLength(TSYString *string) {
    return (NULL != string) ? string->_length : 0;
}

void __TSYStringDeallocate(TSYString *string) {
    TSYStringSetData(string, NULL);
    
    __TSYObjectDeallocate(string);
}

#pragma mark -
#pragma mark Private Implementations

void TSYStringSetData(TSYString *string, char *data) {
    if (NULL != string && string->_data != data) {
        if (NULL != string->_data && NULL == data) {
            TSYStringSetLength(string, 0);
        }
        
        if (NULL != data) {
            uint64_t newLength = strlen(data) + 1;
            
            TSYStringSetLength(string, newLength);

            memcpy(string->_data, data, newLength - 1);
        }
    }
}

void TSYStringSetLength(TSYString *string, uint64_t newLength) {
    if (NULL == string || TSYStringGetLength(string) == newLength) {
        return;
    }
    
    if (0 == newLength) {
        free(string->_data);
        string->_data = NULL;
    } else {
        string->_data = realloc(string->_data, newLength);
        assert(NULL != string->_data);
        
        memset(string->_data, 0, newLength * sizeof(*(string->_data)));
    }
    
    string->_length = newLength;
}

//
//  TSYLinkedListEnumerator.h
//  TSYHomework
//
//  Created by Admin on 31.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYLinkedListEnumerator__
#define __TSYHomework__TSYLinkedListEnumerator__

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#include "TSYObject.h"

typedef struct TSYLinkedList TSYLinkedList;
typedef struct TSYLinkedListNode TSYLinkedListNode;

struct TSYLinkedListEnumerator {
    TSYObject _super;
    
    TSYLinkedList *_list;
    TSYLinkedListNode *_currentNode;
    
    uint64_t _mutationCount;
    bool _isValid;
};
typedef struct TSYLinkedListEnumerator TSYLinkedListEnumerator;

extern
TSYLinkedListEnumerator *TSYLinkedListEnumeratorCreateWithLinkedList(TSYLinkedList *list);

extern
void __TSYLinkedListEnumeratorDeallocate(TSYLinkedListEnumerator *enumerator);

extern
void *TSYLinkedListEnumeratorGetNextObject(TSYLinkedListEnumerator *enumerator);

extern
bool TSYLinkedListEnumeratorIsValid(TSYLinkedListEnumerator *enumerator);

#endif /* defined(__TSYHomework__TSYLinkedListEnumerator__) */

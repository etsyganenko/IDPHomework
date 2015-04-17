//
//  TSYLinkedList.h
//  TSYHomework
//
//  Created by Admin on 30.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYLinkedList__
#define __TSYHomework__TSYLinkedList__

#include <stdio.h>
#include <string.h>

#include "TSYObject.h"
#include "TSYLinkedListNode.h"
#include "TSYPropertySet.h"
#include "TSYLinkedListEnumerator.h"

typedef struct TSYLinkedListNodeContext TSYLinkedListNodeContext;
typedef bool(*TSYComparisonFunction)(void *object, TSYLinkedListNodeContext *context);

struct TSYLinkedList {
    TSYObject _super;
    
    TSYLinkedListNode *_rootNode;
    
    uint64_t _count;
    uint64_t _mutationCount;
};
typedef struct TSYLinkedList TSYLinkedList;

extern
TSYLinkedList *TSYLinkedListCreate();

extern
void __TSYLinkedListDeallocate(TSYLinkedList *list);

extern
TSYLinkedListNode *TSYLinkedListGetRootNode(TSYLinkedList *list);

extern
void TSYLinkedListSetRootNode(TSYLinkedList *list, TSYLinkedListNode *node);

extern
uint64_t TSYLinkedListGetCount(TSYLinkedList *list);

extern
uint64_t TSYLinkedListGetMutationCount(TSYLinkedList *list);

extern
void TSYLinkedListAddObject(TSYLinkedList *list, void *object);

extern
void TSYLinkedListRemoveObject(TSYLinkedList *list, void *object);

extern
void TSYLinkedListInsertObjectAfterObject(TSYLinkedList *list, void *object, void *insertionPoint);

extern
void TSYLinkedListRemoveFirstObject(TSYLinkedList *list);

extern
void TSYLinkedListRemoveAllObjects(TSYLinkedList *list);

#endif /* defined(__TSYHomework__TSYLinkedList__) */

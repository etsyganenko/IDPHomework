//
//  TSYLinkedListNode.h
//  TSYHomework
//
//  Created by Admin on 30.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYLinkedListNode__
#define __TSYHomework__TSYLinkedListNode__

#include <stdio.h>
#include "TSYObject.h"
#include "TSYPropertySet.h"

typedef struct TSYLinkedListNode TSYLinkedListNode;
struct TSYLinkedListNode {
    TSYObject _super;
    
    TSYLinkedListNode *_nextNode;
    
    TSYObject *_object;
};

extern
TSYLinkedListNode *TSYLinkedListNodeCreateWithObject(TSYObject *object);

extern
void __TSYLinkedListNodeDeallocate(TSYLinkedListNode *node);

extern
TSYObject *TSYLinkedListNodeGetObject(TSYLinkedListNode *node);

extern
void TSYLinkedListNodeSetObject(TSYLinkedListNode *node, TSYObject *object);

extern
TSYLinkedListNode *TSYLinkedListNodeGetNextNode(TSYLinkedListNode *node);

extern
void TSYLinkedListNodeSetNextNode(TSYLinkedListNode *node, TSYLinkedListNode *nextNode);

#endif /* defined(__TSYHomework__TSYLinkedListNode__) */

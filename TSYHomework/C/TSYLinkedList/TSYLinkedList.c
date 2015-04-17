//
//  TSYLinkedList.c
//  TSYHomework
//
//  Created by Admin on 30.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYLinkedList.h"
#include "TSYLinkedListEnumeratorPrivate.h"

#pragma mark -
#pragma mark Private Declarations

void TSYLinkedListMutate(TSYLinkedList *list);

struct TSYLinkedListNodeContext {
    TSYLinkedListNode *node;
    TSYLinkedListNode *previousNode;
    void *object;
};
typedef struct TSYLinkedListNodeContext TSYLinkedListNodeContext;

TSYLinkedListNodeContext TSYLinkedListGetObjectContext(TSYLinkedList *list, void *object);

TSYLinkedListNode *TSYLinkedListGetNodeForObject(TSYLinkedList *list, void *object);

TSYLinkedListNode *TSYLinkedListFindNode(TSYLinkedList *list, TSYLinkedListNodeContext *context, TSYComparisonFunction comparator);

bool TSYLinkedListNodeContainsObject(void *node, TSYLinkedListNodeContext *context);

#pragma mark -
#pragma mark Public Implementations

TSYLinkedList *TSYLinkedListCreate() {
    TSYLinkedList *list = TSYObjectCreate(TSYLinkedList);
    
    return list;
}

void __TSYLinkedListDeallocate(TSYLinkedList *list) {
    TSYLinkedListRemoveAllObjects(list);
//    TSYLinkedListSetRootNode(list, NULL);
    
    __TSYObjectDeallocate(list);
}

TSYLinkedListNode *TSYLinkedListGetRootNode(TSYLinkedList *list) {
    return (NULL != list) ? list->_rootNode : NULL;
}

void TSYLinkedListSetRootNode(TSYLinkedList *list, TSYLinkedListNode *node) {
    if (NULL == list) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&list->_rootNode, node);
}

uint64_t TSYLinkedListGetCount(TSYLinkedList *list) {
    return (NULL != list) ? list->_count : 0;
}

uint64_t TSYLinkedListGetMutationCount(TSYLinkedList *list) {
    return (NULL != list) ? list->_mutationCount : 0;
}

void TSYLinkedListAddObject(TSYLinkedList *list, void *object) {
    if (NULL == list) {
        return;
    }
    
    TSYLinkedListMutate(list);
    TSYLinkedListNode *rootNode = TSYLinkedListGetRootNode(list);
    TSYLinkedListNode *node = TSYLinkedListNodeCreateWithObject(object);
    
    if (NULL != rootNode) {
        TSYLinkedListNodeSetNextNode(node, rootNode);
    }
    
    TSYLinkedListSetRootNode(list, node);
    list->_count++;
    
    TSYObjectRelease(node);
}

void TSYLinkedListRemoveObject(TSYLinkedList *list, void *object) {
    if (NULL == list) {
        return;
    }

    TSYLinkedListNodeContext context = TSYLinkedListGetObjectContext(list, object);
    TSYLinkedListNode *node = context.node;
    
    TSYLinkedListMutate(list);
    
    if (node == TSYLinkedListGetRootNode(list)) {
        TSYLinkedListRemoveFirstObject(list);
    } else {
        TSYLinkedListNodeSetNextNode(context.previousNode, TSYLinkedListNodeGetNextNode(node));
    }
    
    list->_count--;
}

void TSYLinkedListInsertObjectAfterObject(TSYLinkedList *list, void *object, void *insertionPoint) {
    if (NULL == list) {
        return;
    }
    
    TSYLinkedListNode *insertedNode = TSYLinkedListNodeCreateWithObject(object);
    TSYLinkedListNode *node = TSYLinkedListGetNodeForObject(list, insertionPoint);
    TSYLinkedListNode *nextNode = TSYLinkedListNodeGetNextNode(node);
    
    TSYLinkedListMutate(list);
    TSYLinkedListNodeSetNextNode(node, nextNode);
    TSYLinkedListNodeSetNextNode(insertedNode, nextNode);
    list->_count--;
    
    TSYObjectRelease(insertedNode);
}

void TSYLinkedListRemoveFirstObject(TSYLinkedList *list) {
    if (NULL == list) {
        return;
    }
    
    TSYLinkedListNode *rootNode = TSYLinkedListGetRootNode(list);
    
    if (NULL == rootNode) {
        return;
    }
    
    TSYLinkedListMutate(list);
    
    TSYLinkedListNode *nextNode = TSYLinkedListNodeGetNextNode(rootNode);
    
    if (NULL != nextNode) {
        TSYLinkedListSetRootNode(list, nextNode);
    }
    
    list->_count--;
}

void TSYLinkedListRemoveAllObjects(TSYLinkedList *list) {
    if (NULL == list) {
        return;
    }
    
    while (0 != TSYLinkedListGetCount(list)) {
        TSYLinkedListRemoveFirstObject(list);
    }
}

#pragma mark -
#pragma mark Private Implementations

void TSYLinkedListMutate(TSYLinkedList *list) {
    if (NULL != list) {
        list->_mutationCount++;
    }
}

TSYLinkedListNodeContext TSYLinkedListGetObjectContext(TSYLinkedList *list, void *object) {
    TSYLinkedListNodeContext context;
    
    memset(&context, 0, sizeof(context));
    context.object = object;
    
    TSYLinkedListNode *node = TSYLinkedListFindNode(list, &context, TSYLinkedListNodeContainsObject);
    
    context.node = node;
    
    return context;
}

TSYLinkedListNode *TSYLinkedListFindNode(TSYLinkedList *list, TSYLinkedListNodeContext *context, TSYComparisonFunction comparator) {
    if (NULL == list) {
        return NULL;
    }
    
    TSYLinkedListEnumerator *enumerator = TSYLinkedListEnumeratorCreateWithLinkedList(list);
    TSYLinkedListNode *node = NULL;
    
    while ((node = TSYLinkedListEnumeratorGetNextNode(enumerator))) {
        if (comparator(node, context)) {
            break;
        }
    }
    
    TSYObjectRelease(enumerator);
    
    return node;
}

bool TSYLinkedListNodeContainsObject(void *node, TSYLinkedListNodeContext *context) {
    TSYLinkedListNodeContext *nodeContext = context;
    
    nodeContext->previousNode = nodeContext->node;
    nodeContext->node = node;
    
    return (TSYLinkedListNodeGetObject(node) == nodeContext->object);
}

TSYLinkedListNode *TSYLinkedListGetNodeForObject(TSYLinkedList *list, void *object) {
    if (NULL == list) {
        return NULL;
    }
    
    TSYLinkedListNode *node = NULL;
    
    TSYLinkedListEnumerator *enumarator = TSYLinkedListEnumeratorCreateWithLinkedList(list);
    
    while (TSYLinkedListEnumeratorIsValid(enumarator)) {
        node = TSYLinkedListEnumeratorGetNextNode(enumarator);
        
        if (object == TSYLinkedListNodeGetObject(node)) {
            break;
        }
    }
    
    TSYObjectRelease(enumarator);
    
    return node;
}

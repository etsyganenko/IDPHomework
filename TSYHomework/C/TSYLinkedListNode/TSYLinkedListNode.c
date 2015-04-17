//
//  TSYLinkedListNode.c
//  TSYHomework
//
//  Created by Admin on 30.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYLinkedListNode.h"

#pragma mark -
#pragma mark Public Implementations

TSYLinkedListNode *TSYLinkedListNodeCreateWithObject(TSYObject *object) {
    TSYLinkedListNode *node = TSYObjectCreate(TSYLinkedListNode);
    TSYLinkedListNodeSetObject(node, object);
    
    return node;
}

void __TSYLinkedListNodeDeallocate(TSYLinkedListNode *node) {
    TSYLinkedListNodeSetObject(node, NULL);
    TSYLinkedListNodeSetNextNode(node, NULL);
    
    __TSYObjectDeallocate(node);
}

TSYObject *TSYLinkedListNodeGetObject(TSYLinkedListNode *node) {
    return (NULL != node) ? node->_object : NULL;
}

void TSYLinkedListNodeSetObject(TSYLinkedListNode *node, TSYObject *object) {
    if (NULL == node) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&node->_object, object);
}

TSYLinkedListNode *TSYLinkedListNodeGetNextNode(TSYLinkedListNode *node) {
    return (NULL != node) ? node->_nextNode : NULL;
}

void TSYLinkedListNodeSetNextNode(TSYLinkedListNode *node, TSYLinkedListNode *nextNode) {
    if (NULL == node) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&node->_nextNode, nextNode);
}

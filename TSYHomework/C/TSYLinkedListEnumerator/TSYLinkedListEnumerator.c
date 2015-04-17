//
//  TSYLinkedListEnumerator.c
//  TSYHomework
//
//  Created by Admin on 31.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYLinkedListEnumerator.h"
#include "TSYLinkedListEnumeratorPrivate.h"
#include "TSYLinkedList.h"
#include "TSYLinkedListNode.h"
#include "TSYPropertySet.h"
#include "TSYConstants.h"

#pragma mark -
#pragma mark Private Declarations

#pragma mark -
#pragma mark Public Implementations

TSYLinkedListEnumerator *TSYLinkedListEnumeratorCreateWithLinkedList(TSYLinkedList *list) {
    if (NULL == list) {
        return NULL;
    }
    
    TSYLinkedListEnumerator *enumerator = TSYObjectCreate(TSYLinkedListEnumerator);

    TSYLinkedListEnumeratorSetList(enumerator, list);
    
    uint64_t listMutationCount = TSYLinkedListGetMutationCount(list);
    TSYLinkedListEnumeratorSetMutationCount(enumerator, listMutationCount);
    
    TSYLinkedListEnumeratorSetValid(enumerator, true);
    
    return enumerator;
}

void __TSYLinkedListEnumeratorDeallocate(TSYLinkedListEnumerator *enumerator) {
    TSYLinkedListEnumeratorSetCurrentNode(enumerator, NULL);
    TSYLinkedListEnumeratorSetList(enumerator, NULL);
    
    __TSYObjectDeallocate(enumerator);
}

void *TSYLinkedListEnumeratorGetNextObject(TSYLinkedListEnumerator *enumerator) {
    if (NULL == enumerator) {
        return NULL;
    }
    
    TSYLinkedListNode *nextNode = TSYLinkedListEnumeratorGetNextNode(enumerator);
    
    return TSYLinkedListNodeGetObject(nextNode);
}

bool TSYLinkedListEnumeratorIsValid(TSYLinkedListEnumerator *enumerator) {
    return (NULL != enumerator) ? enumerator->_isValid : false;
}

#pragma mark -
#pragma mark Private Implementations

TSYLinkedList *TSYLinkedListEnumeratorGetList(TSYLinkedListEnumerator *enumerator) {
    return (NULL != enumerator) ? enumerator->_list : NULL;
}

void TSYLinkedListEnumeratorSetList(TSYLinkedListEnumerator *enumerator, TSYLinkedList *list) {
    if (NULL == enumerator) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&enumerator->_list, list);
}

TSYLinkedListNode *TSYLinkedListEnumeratorGetCurrentNode(TSYLinkedListEnumerator *enumerator) {
    return (NULL != enumerator) ? enumerator->_currentNode : NULL;
}

TSYLinkedListNode *TSYLinkedListEnumeratorGetNextNode(TSYLinkedListEnumerator *enumerator) {
    if (NULL == enumerator || !TSYLinkedListEnumeratorIsValid(enumerator)) {
        return NULL;
    }
    
    TSYLinkedListEnumeratorCheckMutationCount(enumerator);
    
    TSYLinkedListNode *currentNode = TSYLinkedListEnumeratorGetCurrentNode(enumerator);
    
    if (NULL == currentNode) {
        currentNode = TSYLinkedListGetRootNode(TSYLinkedListEnumeratorGetList(enumerator));
        TSYLinkedListEnumeratorSetCurrentNode(enumerator, currentNode);
        
        return currentNode;
    }
    
    TSYLinkedListNode *nextNode = TSYLinkedListNodeGetNextNode(currentNode);
    
    if (NULL == nextNode) {
        TSYLinkedListEnumeratorSetValid(enumerator, false);
    }
    
    TSYLinkedListEnumeratorSetCurrentNode(enumerator, nextNode);
    
    return nextNode;
}

void TSYLinkedListEnumeratorSetCurrentNode(TSYLinkedListEnumerator *enumerator, TSYLinkedListNode *node) {
    if (NULL == enumerator) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&enumerator->_currentNode, node);
}

uint64_t TSYLinkedListEnumeratorGetMutationCount(TSYLinkedListEnumerator *enumerator) {
    return (NULL != enumerator) ? enumerator->_mutationCount : TSYValueNotFound;
}

void TSYLinkedListEnumeratorSetMutationCount(TSYLinkedListEnumerator *enumerator, uint64_t count) {
    if (NULL == enumerator) {
        return;
    }
    
    enumerator->_mutationCount = count;
}

void TSYLinkedListEnumeratorSetValid(TSYLinkedListEnumerator *enumerator, bool isValid) {
    if (NULL == enumerator) {
        return;
    }
    
    enumerator->_isValid = isValid;
}

void TSYLinkedListEnumeratorCheckMutationCount(TSYLinkedListEnumerator *enumerator) {
    if (NULL == enumerator) {
        return;
    }
    
    TSYLinkedList *list = TSYLinkedListEnumeratorGetList(enumerator);
    
    uint64_t listMutationCount = TSYLinkedListGetMutationCount(list);
    uint64_t enumeratorMutationCount = TSYLinkedListEnumeratorGetMutationCount(enumerator);
    
    assert(listMutationCount == enumeratorMutationCount);
}

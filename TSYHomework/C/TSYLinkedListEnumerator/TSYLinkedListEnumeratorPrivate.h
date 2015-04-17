//
//  TSYLinkedListEnumeratorPrivate.h
//  TSYHomework
//
//  Created by Admin on 03.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef TSYHomework_TSYLinkedListEnumeratorPrivate_h
#define TSYHomework_TSYLinkedListEnumeratorPrivate_h

#include "TSYLinkedListEnumerator.h"

extern
TSYLinkedList *TSYLinkedListEnumeratorGetList(TSYLinkedListEnumerator *enumerator);

extern
void TSYLinkedListEnumeratorSetList(TSYLinkedListEnumerator *enumerator, TSYLinkedList *list);

extern
TSYLinkedListNode *TSYLinkedListEnumeratorGetCurrentNode(TSYLinkedListEnumerator *enumerator);

extern
void TSYLinkedListEnumeratorSetCurrentNode(TSYLinkedListEnumerator *enumerator, TSYLinkedListNode *node);

extern
uint64_t TSYLinkedListEnumeratorGetMutationCount(TSYLinkedListEnumerator *enumerator);

extern
void TSYLinkedListEnumeratorSetMutationCount(TSYLinkedListEnumerator *enumerator, uint64_t count);

extern
void TSYLinkedListEnumeratorSetValid(TSYLinkedListEnumerator *enumerator, bool isValid);

extern
void TSYLinkedListEnumeratorCheckMutationCount(TSYLinkedListEnumerator *enumerator);

extern
TSYLinkedListNode *TSYLinkedListEnumeratorGetNextNode(TSYLinkedListEnumerator *enumerator);

#endif

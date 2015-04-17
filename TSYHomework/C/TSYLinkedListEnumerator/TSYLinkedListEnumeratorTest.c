//
//  TSYLinkedListEnumeratorTest.c
//  TSYHomework
//
//  Created by Admin on 02.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYLinkedListEnumeratorTest.h"

void TSYLinkedListEnumeratorPerformTest() {
    uint64_t length = 5;
    TSYObject *objects[length];
    
    for (uint64_t iter = 0; iter < length; iter++) {
        objects[iter] = TSYObjectCreate(TSYObject);
    }
    
    TSYLinkedList *list = TSYLinkedListCreate();
    
    for (uint64_t iter = 0; iter < length; iter++) {
        TSYLinkedListAddObject(list, objects[iter]);
    }
    
    
//TSYLinkedListEnumerator
//  after being created with linked list
    TSYLinkedListEnumerator *enumerator = TSYLinkedListEnumeratorCreateWithLinkedList(list);
    
//      it should be valid
    assert(TSYLinkedListEnumeratorIsValid);
    
//      its next object should equal: objects[4] -> objects[3] -> objects[2] ->
//                              objects[1] -> objects[0] -> NULL
    for (int64_t iter = length - 1; iter >= 0; iter--) {
        assert(objects[iter] == TSYLinkedListEnumeratorGetNextObject(enumerator));
    }
    
    assert(NULL == TSYLinkedListEnumeratorGetNextObject(enumerator));

//          it should be invalid
    assert(!TSYLinkedListEnumeratorIsValid(enumerator));
    
//              its next object should equal NULL
    assert(NULL == TSYLinkedListEnumeratorGetNextObject(enumerator));

    

    
    for (uint64_t iter = 0; iter < length; iter++) {
        TSYObjectRelease(objects[iter]);
    }
}

//
//  TSYLinkedListTest.c
//  TSYHomework
//
//  Created by Admin on 03.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYLinkedListTest.h"

void TSYLinkedListPerformTest() {
    uint64_t length = 5;
    TSYObject *objects[length];
    
    for (uint64_t iter = 0; iter < length; iter++) {
        objects[iter] = TSYObjectCreate(TSYObject);
    }
    
//  TSYLinkedList
//      after being created
    TSYLinkedList *list = TSYLinkedListCreate();
    
//          its root node should equal NULL
    assert(NULL == TSYLinkedListGetRootNode(list));
    
//          its count should equal 0
    assert(0 == TSYLinkedListGetCount(list));
    
//          its mutation count should equal 0
    assert(0 == TSYLinkedListGetMutationCount(list));
    
//              after adding object = objects[0]
    TSYLinkedListAddObject(list, objects[0]);
    
//                  its root node shouldn't equal NULL
    assert(NULL != TSYLinkedListGetRootNode(list));
    
//                  its root node should contain objects[0]
    assert(objects[0] == TSYLinkedListNodeGetObject(TSYLinkedListGetRootNode(list)));

//                  its count should equal 1
    assert(1 == TSYLinkedListGetCount(list));

//                  its mutation count should equal 1
    assert(1 == TSYLinkedListGetMutationCount(list));
    
//                      after adding 4 objects: objects[1], objects[2], objects[3] and objects[4]
    for (uint64_t iter = 1; iter <= 4; iter++) {
        TSYLinkedListAddObject(list, objects[iter]);
    }
    
//                          its count should equal 5
    assert(5 == TSYLinkedListGetCount(list));
    
//                              after removing first object
    TSYLinkedListRemoveFirstObject(list);
    
//                                  its count should equal 4
    assert(4 == TSYLinkedListGetCount(list));
    
//                                      after removing object = objects[2]
    TSYLinkedListRemoveObject(list, objects[2]);
    
//                                          its count should equal 3
    assert(3 == TSYLinkedListGetCount(list));
    
//                                              after removing all objects
    TSYLinkedListRemoveAllObjects(list);
    
//                                                  its count should equal 0
    assert(0 == TSYLinkedListGetCount(list));
    
//               after adding 4 objects: objects[1], objects[2], objects[3] and objects[4]
    for (uint64_t iter = 1; iter <= 4; iter++) {
        TSYLinkedListAddObject(list, objects[iter]);
    }
    
//                  its count should equal 4
    assert(4 == TSYLinkedListGetCount(list));
    
//                      after inserting objects[0] after objects[4]
    TSYLinkedListInsertObjectAfterObject(list, objects[0], objects[4]);
    
//                          enumerator next object value should equal
    TSYLinkedListEnumerator *enumerator = TSYLinkedListEnumeratorCreateWithLinkedList(list);
    
    assert(objects[4] == TSYLinkedListEnumeratorGetNextObject(enumerator));
    assert(objects[0] == TSYLinkedListEnumeratorGetNextObject(enumerator));
    assert(objects[3] == TSYLinkedListEnumeratorGetNextObject(enumerator));
    assert(objects[2] == TSYLinkedListEnumeratorGetNextObject(enumerator));
    assert(objects[1] == TSYLinkedListEnumeratorGetNextObject(enumerator));
    
    
    TSYObjectRelease(enumerator);
    TSYObjectRelease(list);
    
    for (uint64_t iter = 0; iter < length; iter++) {
        TSYObjectRelease(objects[iter]);
    }
}

//
//  TSYArrayTest.c
//  TSYHomework
//
//  Created by Admin on 14.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYArrayTest.h"

void TSYArrayPerformTests() {
    TSYObject *object1 = TSYObjectCreate(TSYObject);
    TSYObject *object2 = TSYObjectCreate(TSYObject);
    TSYObject *object3 = TSYObjectCreate(TSYObject);
    TSYObject *object4 = TSYObjectCreate(TSYObject);
    TSYObject *object5 = TSYObjectCreate(TSYObject);
    TSYObject *object6 = TSYObjectCreate(TSYObject);
    TSYObject *object7 = TSYObjectCreate(TSYObject);
    
// TSYArray
//  after creating
    TSYArray *array = TSYArrayCreate();
    
//      its count should be 0
    assert(0 == TSYArrayGetCount(array));
    
//      its length should be 0
    assert(0 == TSYArrayGetLength(array));
    
//          after adding object = TSYObject *object1 to array
    TSYArrayAddObject(array, object1);
    
//              its count should be 1
    assert(1 == TSYArrayGetCount(array));
    
//              its length should be 2
    assert(2 == TSYArrayGetLength(array));
    
//              it should contain that object
    assert(TSYArrayContainsObject(array, object1));
    
//              objects retain count should increase by 1
    assert(2 == TSYObjectGetReferenceCount(object1));
    
//                  after adding null to array
    TSYArrayAddObject(array, NULL);
    
//                      its count should be 1
    assert(1 == TSYArrayGetCount(array));
    
//                      its length should be 2
    assert(2 == TSYArrayGetLength(array));
    
//                      it shouldn't contain null
    assert(!TSYArrayContainsObject(array, NULL));
    
//                          after adding objects TSYObject *object2 and TSYObject *object3 to array
    TSYArrayAddObject(array, object2);
    TSYArrayAddObject(array, object3);
    
//                              its count should be 3
    assert(3 == TSYArrayGetCount(array));
    
//                              its length should be 4
    assert(4 == TSYArrayGetLength(array));
    
//                              it should contain object2 and object3
    assert(TSYArrayContainsObject(array, object2));
    assert(TSYArrayContainsObject(array, object3));
    
//                                  after removing object1 and object2
    TSYArrayRemoveObject(array, object1);
    TSYArrayRemoveObject(array, object2);
    
//                                      its count should be 1
    assert(1 == TSYArrayGetCount(array));
    
//                                      its length should be 2
    assert(2 == TSYArrayGetLength(array));
    
//                                      it shouldn't contain object1 and object2
    assert(!TSYArrayContainsObject(array, object1));
    assert(!TSYArrayContainsObject(array, object2));
    
//                                      object1 and object2 retain count should decrease by 1
    assert(1 == TSYObjectGetReferenceCount(object1));
    assert(1 == TSYObjectGetReferenceCount(object2));
    
//                                          after adding objects TSYObject *object4,
//                                                                         *object5,
//                                                                         *object6,
//                                                                         *object7 to array
    TSYArrayAddObject(array, object4);
    TSYArrayAddObject(array, object5);
    TSYArrayAddObject(array, object6);
    TSYArrayAddObject(array, object7);
                                                                               
//                                              its count should be 5
    assert(5 == TSYArrayGetCount(array));
                                                                               
//                                              its length should be 8
    assert(8 == TSYArrayGetLength(array));
                                                                               
//                                              it should contain object4, object5, object6 and object7
    assert(TSYArrayContainsObject(array, object4));
    assert(TSYArrayContainsObject(array, object5));
    assert(TSYArrayContainsObject(array, object6));
    assert(TSYArrayContainsObject(array, object7));
    
//                                                  after removing all objects
    TSYArrayRemoveAllObjects(array);
    
//                                                      its count should be 0
    assert(0 == TSYArrayGetCount(array));
    
//                                                      its length should be 0
    assert(0 == TSYArrayGetLength(array));
    
//                                              it shouldn't contain object1, object2, object3,
//                                                                   object4, object5, object6 and object7
    
    assert(!TSYArrayContainsObject(array, object1));
    assert(!TSYArrayContainsObject(array, object2));
    assert(!TSYArrayContainsObject(array, object3));
    assert(!TSYArrayContainsObject(array, object4));
    assert(!TSYArrayContainsObject(array, object5));
    assert(!TSYArrayContainsObject(array, object6));
    assert(!TSYArrayContainsObject(array, object7));

    
    TSYObjectRelease(object7);
    TSYObjectRelease(object6);
    TSYObjectRelease(object5);
    TSYObjectRelease(object4);
    TSYObjectRelease(object3);
    TSYObjectRelease(object2);
    TSYObjectRelease(object1);
    TSYObjectRelease(array);
    
}

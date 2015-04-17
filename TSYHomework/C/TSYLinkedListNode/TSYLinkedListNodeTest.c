//
//  TSYLinkedListNodeTest.c
//  TSYHomework
//
//  Created by Admin on 01.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYLinkedListNodeTest.h"

void TSYLinkedListNodePerformTest() {
    uint64_t length = 6;
    TSYObject *objects[length];
    
    for (int iter = 0; iter < length; iter++) {
        objects[iter] = TSYObjectCreate(TSYObject);
        
        assert(1 == TSYObjectGetReferenceCount(objects[iter]));
    }
    
//  TSYLinkedListNode
//      after being created with object = objects[0]
    TSYLinkedListNode *node = TSYLinkedListNodeCreateWithObject(objects[0]);
    
//          it should contain objects[0]
    assert(objects[0] == TSYLinkedListNodeGetObject(node));
    
//          objects[0] retain count should increase by 1
    assert(2 == TSYObjectGetReferenceCount(objects[0]));
    
//             its next node should equal NULL
    assert(NULL == TSYLinkedListNodeGetNextNode(node));
    
//                  after creating nextNode with object = objects[1]
    TSYLinkedListNode *nextNode = TSYLinkedListNodeCreateWithObject(objects[1]);
    
//                      nextNode retain count should equal 1
    assert(1 == TSYObjectGetReferenceCount(nextNode));
    
//                          after setting nextNode as node's next node
    TSYLinkedListNodeSetNextNode(node, nextNode);
    
//                              nextNode should be node's next node
    assert(nextNode == TSYLinkedListNodeGetNextNode(node));
    
//                                  nextNode retain count should increase by 1
    assert(2 == TSYObjectGetReferenceCount(nextNode));
    
//                                      after setting node's object to NULL
    TSYLinkedListNodeSetObject(node, NULL);
    
//                                          objects[1] retain count should decrease by 1
    assert(1 == TSYObjectGetReferenceCount(objects[0]));
    
    TSYObjectRelease(nextNode);
    TSYObjectRelease(node);
    
    for (int iter = 0; iter < length; iter++) {
        TSYObjectRelease(objects[iter]);
    }
}

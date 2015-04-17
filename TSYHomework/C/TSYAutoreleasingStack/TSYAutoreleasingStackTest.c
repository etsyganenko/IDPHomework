//
//  TSYAutoreleasingStackTest.c
//  TSYHomework
//
//  Created by Admin on 01.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYAutoreleasingStackTest.h"

void TSYAutoreleasingStackPerformTest() {
    uint64_t stackSize = 128;
    
    uint64_t length = 5;
    TSYObject *objects[length];
    
    for (int iter = 0; iter < length; iter++) {
        objects[iter] = TSYObjectCreate(TSYObject);
        TSYObjectRetain(objects[iter]);
    }
    
//    TSYAutoreleasingStack
//        after being created with size = stackSize
    TSYAutoreleasingStack *stack = TSYAutoreleasingStackCreateWithSize(stackSize);
    
//          its size equals stackSize
    assert(stackSize == TSYAutoreleasingStackGetSize(stack));
    
//          its current size equals 0
    assert(0 == TSYAutoreleasingStackGetCurrentSize(stack));
    
//          it should be empty, it shouldn't contain any object
    assert(TSYAutoreleasingStackIsEmpty(stack));
    
//              after pushing object = objects[0]
    TSYAutoreleasingStackPushObject(stack, objects[0]);
    
//                  it shouldn't be empty
    assert(!TSYAutoreleasingStackIsEmpty(stack));
    
//                  its current size should equal size of objects[0]
    assert(sizeof(objects[0]) == TSYAutoreleasingStackGetCurrentSize(stack));
    
//                      after popping object
    TSYAutoreleasingStackPopObject(stack);
    
//                          it should be empty
    assert(TSYAutoreleasingStackIsEmpty(stack));
    
//              after pushing 3 objects: objects[0], objects[1], objects[2]
    for (int iter = 0; iter < 3; iter++) {
        TSYAutoreleasingStackPushObject(stack, objects[iter]);
    }
    
//                  after popping objects
    TSYAutoreleasingStackPopObjects(stack);
    
//                      it should be empty
    assert(TSYAutoreleasingStackIsEmpty(stack));
    
//              after pushing 3 objects : objects[0], objects[1], objects[2]
    for (int iter = 0; iter < 3; iter++) {
        TSYAutoreleasingStackPushObject(stack, objects[iter]);
    }
    
//                  after pushing NULL
    TSYAutoreleasingStackPushObject(stack, NULL);
    
//                      after pushing 2 objects : objects[3], objects[4]
    for (int iter = 3; iter < 5; iter++) {
        TSYAutoreleasingStackPushObject(stack, objects[iter]);
    }
    
//                          after popping objects
    TSYAutoreleasingStackPopObjects(stack);
    
//                              it shouldn't be empty
    assert(!TSYAutoreleasingStackIsEmpty(stack));
    
//                          after popping all objects
    TSYAutoreleasingStackPopObjects(stack);
    
//                              it should be empty
    assert(TSYAutoreleasingStackIsEmpty(stack));
    
    
    
    
    TSYObjectRelease(stack);
    
    for (int iter = 0; iter < length; iter++) {
        TSYObjectRelease(objects[iter]);
    }
    
}

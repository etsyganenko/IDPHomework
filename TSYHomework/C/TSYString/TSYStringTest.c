//
//  TSYStringTest.c
//  TSYHomework
//
//  Created by Admin on 21.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYStringTest.h"

void TSYStringTest() {
    TSYHuman *human = TSYHumanCreate();
    char *name = "Ivan";
    
//TSYString
//    after being created with char *name = "Ivan"
    TSYString *string = TSYStringCreate(name);
    
//        its retain count should equal 1
    assert(1 == TSYObjectGetReferenceCount(string));
    
//        its data value is "Ivan"
    printf("string data value is: %s\n", TSYStringGetData(string));
    
//        its length should equal 5
    assert(5 == TSYStringGetLength(string));
    
//            after setting it as TSYHuman name
    TSYHumanSetName(human, string);
    
//                its retain count should equal 2
    assert(2 == TSYObjectGetReferenceCount(string));
    
//                address of its data shouldn't equal address of char *name
    assert(name != TSYStringGetData(string));
    
//                    after setting new data "Egorych"
    char *name1 = "Egorych";
    TSYStringSetData(string, name1);
    
//                        its length should equal 8
    assert(8 == TSYStringGetLength(string));
    
//                        its data value is "Egorych"
    printf("string data value is: %s\n", TSYStringGetData(string));
    
//                          after setting NULL data
    TSYStringSetData(string, NULL);
    
//                              its data value is NULL
    printf("string data value is: %s\n", TSYStringGetData(string));
    
//                              its length should equal 0
    assert(0 == TSYStringGetLength(string));
    
    TSYObjectRelease(string);
    TSYObjectRelease(human);
}

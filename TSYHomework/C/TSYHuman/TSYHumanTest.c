//
//  TSYHumanTest.c
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYHumanTest.h"

void TSYHumanTest() {
    TSYString *ivanName = TSYStringCreate("Ivan");
    TSYString *olyaName = TSYStringCreate("Olya");
    
//TSYHuman *human1 and TSYHuman *human2
//  after being created
    TSYHuman *human1 = TSYHumanCreate();
    TSYHuman *human2 = TSYHumanCreate();
    
//      human1 and human2 retain count should equal 1
    assert(1 == TSYObjectGetReferenceCount(human1));
    assert(1 == TSYObjectGetReferenceCount(human2));
    
//      human1 and human2 name should equal NULL
    assert(NULL == TSYStringGetData(TSYHumanGetName(human1)));
    assert(NULL == TSYStringGetData(TSYHumanGetName(human2)));
    
//      human1 and human2 age should equal 0
    assert(0 == TSYHumanGetAge(human1));
    assert(0 == TSYHumanGetAge(human2));
    
//      human1 and human2 gender should equal TSYGenderNone
    assert(TSYGenderNone == TSYHumanGetGender(human1));
    assert(TSYGenderNone == TSYHumanGetGender(human2));
    
//          after setting gender = TSYGenderFemale for human2 and gender = TSYGenderMale for human1
    TSYHumanSetGender(human2, TSYGenderFemale);
    TSYHumanSetGender(human1, TSYGenderMale);
    
//              human1 gender should equal TSYGenderMale, human2 gender should equal TSYGenderFemale
    assert(TSYGenderMale == TSYHumanGetGender(human1));
    assert(TSYGenderFemale == TSYHumanGetGender(human2));
    
//          after setting name = char *name1 for human1 and name = char *name2 for human2
    TSYHumanSetName(human1, ivanName);
    TSYHumanSetName(human2, olyaName);
    
//              human1 name should equal "Ivan", human2 name should equal "Olya"
    assert(ivanName == TSYHumanGetName(human1));
    assert(olyaName == TSYHumanGetName(human2));
    
//          after setting age = 25 for human1 and age = 24 for human2
    TSYHumanSetAge(human1, 25);
    TSYHumanSetAge(human2, 24);
    
//              human1 age should equal 25, human2 age should equal 24
    assert(25 == TSYHumanGetAge(human1));
    assert(24 == TSYHumanGetAge(human2));
    
//          human1 partner and human2 partner should equal NULL
    assert(NULL == TSYHumanGetPartner(human1));
    assert(NULL == TSYHumanGetPartner(human2));
    
//              after human1 and human2 were married
    TSYHumanMarry(human1, human2);
    
//                  human1 partner should be human2, human2 partner should be human1
    assert(human2 == TSYHumanGetPartner(human1));
    assert(human1 == TSYHumanGetPartner(human2));
    
//                  human1 retain count should equal 1
    assert(1 == TSYObjectGetReferenceCount(human1));
    
//                  human2 retain count should equal 2
    assert(2 == TSYObjectGetReferenceCount(human2));
    
//                  human1 and human2 children count should equal 0
    assert(0 == TSYArrayGetCount(TSYHumanGetChildren(human1)));
    assert(0 == TSYArrayGetCount(TSYHumanGetChildren(human2)));
    
//                      after child = child1 birth
    TSYHuman *child1 = TSYHumanGiveBirth(human2);
    
//                          child1 retain count should equal 2
    assert(2 == TSYObjectGetReferenceCount(child1));
    
//                          human1 retain count should equal 2
    assert(2 == TSYObjectGetReferenceCount(human1));
    
//                          human2 retain count should equal 3
    assert(3 == TSYObjectGetReferenceCount(human2));
    
//                          human1 and human2 children count should equal 1
    assert(1 == TSYArrayGetCount(TSYHumanGetChildren(human1)));
    assert(1 == TSYArrayGetCount(TSYHumanGetChildren(human2)));
    
//                          child1 mothers name should be "Olya"
    assert(olyaName == TSYHumanGetName(TSYHumanGetMother(child1)));
    
//                          child1 fathers name should be "Ivan"
    assert(ivanName == TSYHumanGetName(TSYHumanGetFather(child1)));

//                              after child2, child3, child4, child5 birth
    TSYHuman *child2 = TSYHumanGiveBirth(human2);
    TSYHuman *child3 = TSYHumanGiveBirth(human2);
    TSYHuman *child4 = TSYHumanGiveBirth(human2);
    TSYHuman *child5 = TSYHumanGiveBirth(human2);
    
//                                  human1 and human2 children count should equal 5
    assert(5 == TSYArrayGetCount(TSYHumanGetChildren(human1)));
    assert(5 == TSYArrayGetCount(TSYHumanGetChildren(human2)));

//                                      after removing child2
    TSYHumanRemoveChild(human1, child2);
    TSYHumanRemoveChild(human2, child2);
    
//                                          human1 and human2 children count should equal 4
    assert(4 == TSYArrayGetCount(TSYHumanGetChildren(human1)));
    assert(4 == TSYArrayGetCount(TSYHumanGetChildren(human2)));
    
//                                          human1 and human2 shouldn't have child2
    assert(false == TSYArrayContainsObject(TSYHumanGetChildren(human1), child2));
    assert(false == TSYArrayContainsObject(TSYHumanGetChildren(human2), child2));
    
//                                              after removing all children
    TSYHumanRemoveAllChildren(human1);
    TSYHumanRemoveAllChildren(human2);
    
//                                                  human1 and human2 children count should equal 0
    assert(0 == TSYArrayGetCount(TSYHumanGetChildren(human1)));
    assert(0 == TSYArrayGetCount(TSYHumanGetChildren(human2)));
    
//                                                      after human1 and human2 were divorced
    TSYHumanDivorce(human1);
    
//                                                          human1 retain count should equal 1
    assert(1 == TSYObjectGetReferenceCount(human1));
    
//                                                          human2 retain count should equal 1
    assert(1 == TSYObjectGetReferenceCount(human2));
    
//                                                          human1 partner and human2 partner should equal NULL
    assert(NULL == TSYHumanGetPartner(human1));
    assert(NULL == TSYHumanGetPartner(human2));
    
    
    TSYObjectRelease(child5);
    TSYObjectRelease(child4);
    TSYObjectRelease(child3);
    TSYObjectRelease(child2);
    TSYObjectRelease(child1);
    TSYObjectRelease(human2);
    TSYObjectRelease(human1);
    TSYObjectRelease(olyaName);
    TSYObjectRelease(ivanName);
}

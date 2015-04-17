//
//  main.c
//  C
//
//  Created by Admin on 17.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include <stdio.h>
#include "TSYStructureOutputTest.h"
#include "TSYOutputParentTest.h"
#include "TSYMacros.h"
#include "TSYBitOutputTest.h"
#include "TSYHumanTest.h"
#include "TSYStringTest.h"
#include "TSYArrayTest.h"
#include "TSYAutoreleasingStackTest.h"
#include "TSYLinkedListNodeTest.h"
#include "TSYLinkedListEnumeratorTest.h"
#include "TSYLinkedListTest.h"

int main(int argc, const char * argv[]) {
//    TSYLinkedListPerformTest();
    
    TSYLinkedListEnumeratorPerformTest();
    
    TSYLinkedListNodePerformTest();
    
    TSYAutoreleasingStackPerformTest();
    
    //    TSYHumanTest();
    
    //    TSYStringTest();
    
    //    TSYArrayPerformTests();
    
    //    TSYStructureOutputTests();
    //
    //    TSYOutputParentTest();
    //
    //    TSYMacrosTest();
    
    //    TSYBitOutputTest();
    return 0;
}

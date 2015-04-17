//
//  TSYOutputParentTest.c
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include <assert.h>
#include "TSYOutputParentTest.h"
#include "TSYOutputParent.h"

void TSYOutputParentTest() {
    assert(TSYMamaResult == TSYOutputParent(6));
    assert(TSYMamaResult == TSYOutputParent(9));
    assert(TSYMamaResult == TSYOutputParent(18));
    
    assert(TSYPapaResult == TSYOutputParent(10));
    assert(TSYPapaResult == TSYOutputParent(25));
    assert(TSYPapaResult == TSYOutputParent(50));
    
    assert(TSYMamaPapaResult == TSYOutputParent(30));
    assert(TSYMamaPapaResult == TSYOutputParent(45));
    assert(TSYMamaPapaResult == TSYOutputParent(60));
    
    assert(TSYNoResult == TSYOutputParent(7));
    assert(TSYNoResult == TSYOutputParent(23));
    assert(TSYNoResult == TSYOutputParent(41));
    
    for ( int iter = 0; iter <= 45; iter++ ) {
        printf("%03d) ", iter);
        TSYOutputParent(iter);
    }
    
    printf("\n");
}

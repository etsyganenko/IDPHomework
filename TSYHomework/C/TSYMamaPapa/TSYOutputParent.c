//
//  TSYOutputParent.c
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYOutputParent.h"

TSYParentResult TSYOutputParent(int value) {
    int result = TSYNoResult;
    
    if (0 != value) {
        if (0 == (value % 3)) {
            printf("Mama");
            result += TSYMamaResult;
        }
        
        if (0 == (value % 5)) {
            printf("Papa");
            result += TSYPapaResult;
        }
    }
    
    printf("\n");
    
    return result;
}

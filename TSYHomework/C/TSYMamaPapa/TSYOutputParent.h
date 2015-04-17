//
//  TSYOutputParent.h
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYOutputParent__
#define __TSYHomework__TSYOutputParent__

#include <stdio.h>

typedef enum {
    TSYNoResult,
    TSYMamaResult,
    TSYPapaResult,
    TSYMamaPapaResult
} TSYParentResult;
typedef TSYParentResult TSYParentResult;

extern
TSYParentResult TSYOutputParent(int value);

#endif /* defined(__TSYHomework__TSYOutputParent__) */

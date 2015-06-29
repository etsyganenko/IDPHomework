//
//  UINib+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 29.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "UINib+TSYCategory.h"

@implementation UINib (TSYCategory)

+ (id)viewWithClass:(Class)cls {
    UINib *nib = [self nibWithNibName:NSStringFromClass(cls) bundle:nil];
    NSArray *views = [nib instantiateWithOwner:nil options:nil];
    
    for (id view in views) {
        if ([view isMemberOfClass:cls]) {
            return view;
        }
    }
    
    return nil;
}

@end

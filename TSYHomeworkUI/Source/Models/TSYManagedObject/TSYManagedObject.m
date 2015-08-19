//
//  TSYManagedObject.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYManagedObject.h"

#import "ActiveRecordKit.h"
#import "TSYFacebookConstants.h"

@implementation TSYManagedObject

@dynamic id;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)objectWithID:(NSString *)id {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:kPredicateStringWithID, id];
    
    NSArray *objects = [self fetchEntityWithSortDescriptors:nil
                                                  predicate:predicate
                                              prefetchPaths:nil];
    
    return [objects firstObject];
}

@end

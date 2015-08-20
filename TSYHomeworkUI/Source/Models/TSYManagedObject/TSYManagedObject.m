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

@interface TSYManagedObject ()
@property (nonatomic, strong)   NSString    *identifier;

@end

@implementation TSYManagedObject

//@dynamic ID;
@dynamic identifier;

#pragma mark -
#pragma mark Accessors

- (NSString *)ID {
    return self.identifier;
}

- (void)setID:(NSString *)ID {
    self.identifier = ID;
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)objectWithID:(NSString *)ID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", kPredicateStringWithID, ID];
    
    NSArray *objects = [self fetchEntityWithSortDescriptors:nil
                                                  predicate:predicate
                                              prefetchPaths:nil];
    
    return [objects firstObject];
}

@end

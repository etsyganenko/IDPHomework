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

#pragma mark -
#pragma mark Public Methods

- (void)fillWithDictionary:(NSDictionary *)friendDictionary {
    [self doesNotRecognizeSelector:_cmd];
}

- (NSOrderedSet *)updatedObjects:(NSOrderedSet *)objects
                         ofClass:(Class)theClass
                     withObjects:(NSArray *)newObjects
{
    NSOrderedSet *updatedObjects = [self objectsByUpdatingObjects:objects
                                                          ofClass:theClass
                                                      withObjects:newObjects];
    
    return [self objectsByRemovingMissingObjectsOfClass:theClass
                                            fromObjects:updatedObjects
                                            withObjects:newObjects];
}

#pragma mark -
#pragma mark Private Methods

- (NSOrderedSet *)objectsByUpdatingObjects:(NSOrderedSet *)objects
                                   ofClass:(Class)theClass
                               withObjects:(NSArray *)newObjects
{
    NSMutableOrderedSet *mutableObjects = [NSMutableOrderedSet orderedSetWithOrderedSet:objects];
    
    for (NSDictionary *objectDictionary in newObjects) {
        NSString *objectID = objectDictionary[kIDKey];
        
        id object = [theClass objectWithID:objectID];
        if (!object) {
            object = [theClass managedObject];
        }
        
        [object fillWithDictionary:objectDictionary];
        
        if (![objects containsObject:object]) {
            [mutableObjects addObject:object];
        }
    }
    
    return [NSOrderedSet orderedSetWithOrderedSet:mutableObjects];
}

- (NSOrderedSet *)objectsByRemovingMissingObjectsOfClass:(Class)theClass
                                             fromObjects:(NSOrderedSet *)objects
                                             withObjects:(NSArray *)newObjects
{
    NSMutableOrderedSet *mutableObjects = [NSMutableOrderedSet orderedSetWithOrderedSet:objects];

    for (TSYManagedObject *object in objects) {
        NSString *objectID = object.ID;
        BOOL objectFound = NO;
        
        for (NSDictionary *objectDictionary in newObjects) {
            NSString *ID = objectDictionary[kIDKey];
            if ([objectID isEqualToString:ID]) {
                objectFound = YES;
                
                break;
            }
        }
        
        if (!objectFound) {
            [mutableObjects removeObject:object];
        }
    }
    
    return [NSOrderedSet orderedSetWithOrderedSet:mutableObjects];
}

@end

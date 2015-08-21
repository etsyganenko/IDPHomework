//
//  TSYManagedObject.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface TSYManagedObject : NSManagedObject
@property (nonatomic, strong)   NSString    *ID;

+ (instancetype)objectWithID:(NSString *)ID;

// you must overload this method in children
- (void)fillWithDictionary:(NSDictionary *)friendDictionary;

- (NSOrderedSet *)updatedObjects:(NSOrderedSet *)objects
                         ofClass:(Class)theClass
                     withObjects:(NSArray *)newObjects;

@end

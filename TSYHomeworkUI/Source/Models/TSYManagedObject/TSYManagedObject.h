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

@end

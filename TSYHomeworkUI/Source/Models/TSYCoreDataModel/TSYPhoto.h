//
//  TSYPhoto.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/25/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "TSYManagedObject.h"

@interface TSYPhoto : NSManagedObject
@property (nonatomic, assign)   NSTimeInterval  modifiedDate;
@property (nonatomic, strong)   NSString        *savingPath;

@end

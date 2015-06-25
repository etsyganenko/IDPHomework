//
//  TSYTableChange.h
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYTableCellMovingPath.h"

typedef NS_ENUM(NSUInteger, TSYTableChangeType) {
    TSYTableChangeTypeAdd,
    TSYTableChangeTypeRemove,
    TSYTableChangeTypeMove,
};

@interface TSYTableChange : NSObject
@property (nonatomic, readonly)   TSYTableChangeType        changeType;
@property (nonatomic, readonly)   NSIndexPath               *indexPath;
@property (nonatomic, readonly)   TSYTableCellMovingPath    *indexPaths;

// returns object for Add/Remove change type
+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                          indexPath:(NSIndexPath *)indexPath;

// returns object for Move change type
+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                         indexPaths:(TSYTableCellMovingPath *)indexPaths;

@end

//
//  TSYTableChange.h
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TSYTableChangeType) {
    TSYTableChangeTypeAdd,
    TSYTableChangeTypeRemove,
    TSYTableChangeTypeMove,
};

@interface TSYTableChange : NSObject
@property (nonatomic, readonly)   TSYTableChangeType    changeType;
@property (nonatomic, readonly)   NSArray               *indexPathes;

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                        indexPathes:(NSMutableArray *)indexPathes;

@end

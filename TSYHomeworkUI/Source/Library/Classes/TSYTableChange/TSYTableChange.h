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
@property (nonatomic, readonly)   NSArray               *indexes;

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                            indexes:(NSMutableArray *)indexes;

@end

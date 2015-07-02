//
//  TSYModel.h
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSYObservableObject.h"

@class TSYModel;

typedef NS_ENUM(NSUInteger, TSYModelState) {
    TSYModelStateDidChange
};

typedef NS_ENUM(NSUInteger, TSYModelLoadingState) {
    TSYModelStateUnloading,
    TSYModelStateLoading,
    TSYModelStateDidLoad,
    TSYModelStateFailedLoading
};

@protocol TSYModelObserver <NSObject, NSCoding>

@optional
- (void)modelChanged:(TSYModel *)model withObject:(id)object;
- (void)modelDidLoad:(TSYModel *)model;

@end

@interface TSYModel : TSYObservableObject
@property (nonatomic, assign) NSString    *savingPath;

// this method is for overriding in children
// you should never call it directly
- (void)save;

// this method is for overriding in children
// you should never call it directly
- (void)load;

@end

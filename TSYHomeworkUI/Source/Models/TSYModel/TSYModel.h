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
    TSYModelWillLoad,
    TSYModelDidLoad,
    TSYModelFailedLoading,
    TSYModelUnloaded,
    TSYModelDidChange
};

@protocol TSYModelObserver <NSObject, NSCoding>

@optional
- (void)modelChanged:(TSYModel *)model withObject:(id)object;
- (void)modelDidLoad:(TSYModel *)model;

@end

@interface TSYModel : TSYObservableObject
@property (nonatomic, assign) NSString    *savingPath;

// this method is for overloading in children
- (void)save;

// this method is for overloading in children
- (void)load;

@end

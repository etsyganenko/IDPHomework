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
    TSYModelUnloaded,
    TSYModelWillLoad,
    TSYModelDidLoad,
    TSYModelFailedLoading,
    TSYModelDidChange
};

@protocol TSYModelObserver <NSObject, NSCoding>

@optional
- (void)modelWillLoad:(TSYModel *)model;
- (void)modelDidLoad:(TSYModel *)model;
- (void)modelDidFailLoading:(TSYModel *)model;
- (void)modelChanged:(TSYModel *)model withObject:(id)object;

@end

@interface TSYModel : TSYObservableObject

- (void)load;
- (void)setupLoading;

// this method must be overloaded in children
- (void)performLoading;

@end

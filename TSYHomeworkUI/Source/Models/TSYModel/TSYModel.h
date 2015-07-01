//
//  TSYModel.h
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSYObservableObject.h"

typedef NS_ENUM(NSUInteger, TSYModelState) {
    TSYModelStateDidChange
};

typedef NS_ENUM(NSUInteger, TSYModelLoadingState) {
    TSYModelStateLoading,
    TSYModelStateDidLoad,
    TSYModelStateCancelled
};

@protocol TSYModelObserver <NSObject, NSCoding>

@optional
- (void)modelChanged:(id)model withObject:(id)object;

@end

@interface TSYModel : TSYObservableObject

- (void)save;

@end

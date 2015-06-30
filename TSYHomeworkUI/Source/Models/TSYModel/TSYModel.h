//
//  TSYModel.h
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TSYModelState) {
    TSYModelStateLoading,
    TSYModelStateDidLoad,
    TSYModelStateCancelled
};

@interface TSYModel : NSObject

@end

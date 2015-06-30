//
//  NSBundle+TSYCategory.h
//  TSYHomeworkUI
//
//  Created by Admin on 30.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (TSYCategory)

- (id)objectWithClass:(Class)cls;

- (id)objectWithClass:(Class)cls owner:(id)owner;

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

@end

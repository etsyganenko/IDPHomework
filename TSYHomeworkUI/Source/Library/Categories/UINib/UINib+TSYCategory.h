//
//  UINib+TSYCategory.h
//  TSYHomeworkUI
//
//  Created by Admin on 29.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (TSYCategory)

+ (id)objectWithClass:(Class)cls;

+ (id)objectWithClass:(Class)cls owner:(id)owner;

+ (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

+ (UINib *)nibWithClass:(Class)cls;

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

- (instancetype)objectWithClass:(Class)cls;

- (instancetype)objectWithClass:(Class)cls owner:(id)owner;

- (instancetype)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

@end

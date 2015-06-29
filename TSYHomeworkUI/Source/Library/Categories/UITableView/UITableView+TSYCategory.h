//
//  UITableView+TSYCategory.h
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYTableChange;

@interface UITableView (TSYCategory)

- (id)dequeueReusableCellWithClass:(Class)cls;

- (id)cellWithClass:(Class)cls;

- (void)applyTableChange:(TSYTableChange *)change;

@end

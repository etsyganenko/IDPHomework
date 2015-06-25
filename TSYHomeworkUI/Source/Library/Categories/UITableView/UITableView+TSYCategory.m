//
//  UITableView+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "UITableView+TSYCategory.h"

@implementation UITableView (TSYCategory)

- (id)cellWithClass:(Class)cls {
    NSString *identifier = NSStringFromClass(cls);
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    
    return cell;
}

@end

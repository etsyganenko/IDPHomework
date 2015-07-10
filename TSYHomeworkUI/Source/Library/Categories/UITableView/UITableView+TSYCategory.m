//
//  UITableView+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "UITableView+TSYCategory.h"

#import "TSYTableChange.h"
#import "TSYTableCellMovingPath.h"
#import "UINib+TSYCategory.h"
#import "NSIndexPath+TSYCategory.h"

@implementation UITableView (TSYCategory)

#pragma mark -
#pragma mark Public Methods

- (id)dequeueReusableCellWithClass:(Class)cls {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
}

- (id)cellWithClass:(Class)cls {
    UITableViewCell *cell = [self dequeueReusableCellWithClass:cls];
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

- (void)applyTableChange:(TSYTableChange *)change {
    TSYTableChangeType changeType = change.changeType;
    
    switch (changeType) {
        case TSYTableChangeTypeAdd:{
            NSIndexPath *indexPath = change.changeValue;
            
            [self insertRowsAtIndexPaths:@[indexPath]
                        withRowAnimation:UITableViewRowAnimationFade];
            
            [self scrollToRowAtIndexPath:indexPath
                        atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            break;
        }
            
        case TSYTableChangeTypeRemove:
            [self deleteRowsAtIndexPaths:@[change.changeValue]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case TSYTableChangeTypeMove: {
            TSYTableCellMovingPath *movingPath = change.changeValue;
            
            [self moveRowAtIndexPath:movingPath.sourceIndexPath
                         toIndexPath:movingPath.destinationIndexPath];
            
            break;
        }
            
        default:
            break;
    }
}

@end

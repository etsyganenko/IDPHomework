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

@implementation UITableView (TSYCategory)

- (id)cellWithClass:(Class)cls {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    if (!cell) {
        cell = [UINib viewWithClass:cls];
    }
    
    return cell;
}

- (void)applyChanges:(TSYTableChange *)change {
    TSYTableChangeType changeType = change.changeType;
    NSArray *indexPaths = change.indexPaths;
    TSYTableCellMovingPath *movingPath = change.movingPath;
    
    switch (changeType) {
        case TSYTableChangeTypeAdd:
            [self insertRowsAtIndexPaths:indexPaths
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case TSYTableChangeTypeRemove:
            [self deleteRowsAtIndexPaths:indexPaths
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case TSYTableChangeTypeMove:
            [self moveRowAtIndexPath:movingPath.sourceIndexPath
                              toIndexPath:movingPath.destinationIndexPath];
            
            break;
            
        default:
            break;
    }
}

@end

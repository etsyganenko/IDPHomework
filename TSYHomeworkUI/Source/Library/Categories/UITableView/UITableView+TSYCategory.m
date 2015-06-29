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

@implementation UITableView (TSYCategory)

- (id)cellWithClass:(Class)cls {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    if (!cell) {
        NSArray *cells = [UINib instantiateWithOwner:nil options:nil];
        
        for (id cell in cells) {
            if ([cell isMemberOfClass:cls]) {
                return cell;
            }
        }
    }
    
    return nil;
}

- (void)applyChanges:(TSYTableChange *)change {
    TSYTableChangeType changeType = change.changeType;
    NSArray *indexPaths = change.indexPaths;
    TSYTableCellMovingPath *movingPath = change.movingPath;
    
    switch (changeType) {
        case TSYTableChangeTypeAdd:
            [tableView insertRowsAtIndexPaths:indexPaths
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case TSYTableChangeTypeRemove:
            [tableView deleteRowsAtIndexPaths:indexPaths
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case TSYTableChangeTypeMove:
            [tableView moveRowAtIndexPath:movingPath.sourceIndexPath
                              toIndexPath:movingPath.destinationIndexPath];
            
            break;
            
        default:
            break;
    }
}

@end

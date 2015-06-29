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
    NSString *identifier = NSStringFromClass(cls);
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        UINib *nib = [UINib nibWithClass:cls];
        
        
        
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    
    return cell;
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

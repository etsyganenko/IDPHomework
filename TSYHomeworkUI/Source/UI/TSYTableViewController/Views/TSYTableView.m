//
//  TSYTableView.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableView.h"

#import "TSYUsers.h"
#import "TSYUser.h"

@implementation TSYTableView

- (void)addCell {
//    [self.tableView insertRowsAtIndexPaths: withRowAnimation:UITableViewRowAnimationFade];
    [self.users addUser:[TSYUser userWithRandomNameSurname]];
}

- (void)removeCell {
    [self.tableView setEditing:YES animated:YES];
    
//    [self.tableView deleteRowsAtIndexPaths:
//                          withRowAnimation:UITableViewRowAnimationFade];
    
    [self.users removeUser:[self.users userAtIndex:0]];
    
//    [self.tableView setEditing:NO animated:YES];
}

- (void)moveCell {
    [self.tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]
                           toIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
}

@end

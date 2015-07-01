//
//  TSYTableViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableViewController.h"

#import "TSYTableView.h"
#import "TSYTableCell.h"
#import "TSYMacros.h"
#import "TSYUser.h"
#import "TSYUsers.h"
#import "TSYTableChange.h"
#import "TSYTableCellMovingPath.h"

#import "UITableView+TSYCategory.h"

TSYViewControllerBaseViewProperty(TSYTableViewController, TSYTableView, mainView)

@implementation TSYTableViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.users = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(TSYUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        
        _users = users;
        
        [users addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onButtonAdd:(id)sender {
    [self.users addUser:[TSYUser user]];
}

- (IBAction)onButtonEdit:(id)sender {
    TSYTableView *view = self.mainView;
    
    [view setEditing:!view.editing animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYTableCell *cell = [tableView cellWithClass:[TSYTableCell class]];
    
    cell.user = self.users[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeUserAtIndex:indexPath.row];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
          toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.users moveUserAtIndex:fromIndexPath.row
                        toIndex:toIndexPath.row];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelChanged:(id)model withObject:(id)object {
    [self.mainView.tableView applyTableChange:object];
}

@end

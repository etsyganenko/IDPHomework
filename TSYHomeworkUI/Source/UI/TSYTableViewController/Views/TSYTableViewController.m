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

@interface TSYTableViewController ()

- (void)loadModel:(TSYModel *)model;

@end

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
        
        [_users addObserver:self];
        
        [self loadModel:_users];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadModel:self.users];
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
#pragma mark Private Methods

- (void)loadModel:(TSYModel *)model {
    [self.mainView showLoadingView];
    
    [model load];
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

- (void)modelWillLoad:(TSYModel *)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView showLoadingView];
    });
}

- (void)modelChanged:(TSYModel *)model withObject:(id)object {
    [self.mainView.tableView applyTableChange:object];
}

- (void)modelDidLoad:(TSYModel *)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView hideLoadingView];
        
        [self.mainView.tableView reloadData];
    });
}

@end

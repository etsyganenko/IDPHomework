//
//  TSYSimpleTableViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYSimpleTableViewController.h"

#import "TSYSimpleTableView.h"
#import "TSYSimpleTableCell.h"
#import "TSYMacros.h"
#import "TSYUser.h"
#import "TSYUsers.h"
#import "TSYTableChange.h"
#import "TSYTableCellMovingPath.h"
#import "TSYSquareViewController.h"

#import "UITableView+TSYCategory.h"
#import "NSIndexPath+TSYCategory.h"

TSYViewControllerBaseViewProperty(TSYSimpleTableViewController, TSYSimpleTableView, mainView)

@implementation TSYSimpleTableViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.hidesBarsOnTap = NO;
    
    [self hideUpButtonIfNeeded];
}

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
        
        [_users load];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.users load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self hideUpButtonIfNeeded];
}

#pragma mark -
#pragma mark Interface Handling

- (void)hideUpButtonIfNeeded {
    TSYSimpleTableView *mainView = self.mainView;
    UIButton *upButton = mainView.upButton;
    NSIndexPath *indexPath = [[mainView.tableView indexPathsForVisibleRows] firstObject];

    upButton.hidden = (indexPath.row == 0);
}

- (IBAction)onButtonAdd:(id)sender {
    UITableView *tableView = self.mainView.tableView;
    TSYUsers *users = self.users;
    
    if (!tableView.editing) {
        [users addModel:[TSYUser new]];
    } else {
        NSArray *indexPaths = [tableView indexPathsForSelectedRows];
        NSMutableArray *selectedUsers = [NSMutableArray array];
        NSUInteger count = indexPaths.count;
        
        for (NSUInteger index = 0; index < count; index++) {
            NSIndexPath *path = indexPaths[index];
            
            [selectedUsers addObject:users[path.row]];
        }

        [users removeModels:selectedUsers];
    }
    
    [self hideUpButtonIfNeeded];
}

- (IBAction)onButtonEdit:(id)sender {
    TSYSimpleTableView *view = self.mainView;
    
    [view setEditing:!view.editing animated:YES];
    
    view.tableView.allowsMultipleSelection = YES;
}

- (IBAction)onButtonUp:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForIndex:0];
    
    [self.mainView.tableView scrollToRowAtIndexPath:indexPath
                                   atScrollPosition:UITableViewScrollPositionTop
                                           animated:YES];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
 didEndDisplayingCell:(TSYSimpleTableCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.user = nil;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)        tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!tableView.editing) {        
        TSYSquareViewController *controller = [TSYSquareViewController new];
    
        [self.navigationController pushViewController:controller animated:YES];
        
        //    [self presentViewController:controller animated:YES completion:nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYSimpleTableCell *cell = [tableView cellWithClass:[TSYSimpleTableCell class]];
    
    cell.user = self.users[indexPath.row];
    
    return cell;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeModelAtIndex:indexPath.row];
        
        [self hideUpButtonIfNeeded];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
          toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.users moveModelAtIndex:fromIndexPath.row
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
    TSYSimpleTableView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

- (void)modelDidFailLoading:(TSYModel *)model {
    [self.users load];
}

@end
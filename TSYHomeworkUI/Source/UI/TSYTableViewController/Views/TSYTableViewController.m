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
#import "TSYSquareViewController.h"

#import "UITableView+TSYCategory.h"
#import "NSIndexPath+TSYCategory.h"

static const NSUInteger TSYMaxDisplayedCellsCount    = 15;

TSYViewControllerBaseViewProperty(TSYTableViewController, TSYTableView, mainView)

@implementation TSYTableViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
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

#pragma mark -
#pragma mark Interface Handling

- (void)hideUpButtonIfNeeded {
    UIButton *upButton = self.mainView.upButton;
    NSUInteger cellsCount = self.users.count;
    
    cellsCount < TSYMaxDisplayedCellsCount ? [upButton setHidden:YES] : [upButton setHidden:NO];
}

- (IBAction)onButtonAdd:(id)sender {
    UITableView *tableView = self.mainView.tableView;
    TSYUsers *users = self.users;
    
    if (!tableView.editing) {
        [users addUser:[TSYUser user]];
    } else {
        NSArray *indexPaths = [tableView indexPathsForSelectedRows];
        NSMutableArray *selectedUsers = [NSMutableArray array];
        NSUInteger count = indexPaths.count;
        
        for (NSUInteger index = 0; index < count; index++) {
            NSIndexPath *path = indexPaths[index];
            
            [selectedUsers addObject:[users userAtIndex:path.row]];
        }
        
        [users removeUsers:selectedUsers];
    }
    
    [self hideUpButtonIfNeeded];
}

- (IBAction)onButtonEdit:(id)sender {
    TSYTableView *view = self.mainView;
    
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
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYTableCell *cell = [tableView cellWithClass:[TSYTableCell class]];
    
//    cell.user = self.users[indexPath.row];
    cell.user = [self.users userAtIndex:indexPath.row];
    
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
        
        [self hideUpButtonIfNeeded];
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
    TSYTableView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

- (void)modelDidFailLoading:(TSYModel *)model {
    [self.users load];
}

@end

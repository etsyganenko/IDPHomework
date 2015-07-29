//
//  TSYLoginViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFriendsViewController.h"

#import "TSYMacros.h"
#import "TSYFriendsView.h"
#import "TSYFBUserModel.h"
#import "TSYArrayModel.h"

TSYViewControllerBaseViewProperty(TSYFriendsViewController, TSYFriendsView, mainView)

@implementation TSYFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)        tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSYFBUserModel *model = self.model;
    
    return model.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYTableCell *cell = [tableView cellWithClass:[TSYTableCell class]];
    
    cell.user = self.users[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelWillLoad:(TSYFBUserModel *)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView showLoadingView];
    });
}

- (void)modelDidLoad:(TSYFBUserModel *)model {
    TSYFriendsView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

@end

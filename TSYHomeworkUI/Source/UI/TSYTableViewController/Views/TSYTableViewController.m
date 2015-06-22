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

static const NSInteger TSYTableViewRowsCount =  5;

TSYViewControllerBaseViewProperty(TSYTableViewController, TSYTableView, mainView)

@implementation TSYTableViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return TSYTableViewRowsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClass = NSStringFromClass([TSYTableCell class]);
    
    TSYTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {        
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.user = [TSYUser userWithRandomNameSurname];
    
    return cell;
}

@end

//
//  TSYTableViewController.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/21/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableViewController.h"

#import "TSYTableView.h"
#import "TSYMacros.h"
#import "TSYFacebookConstants.h"

@interface TSYTableViewController ()

- (void)refresh;

@end

@implementation TSYTableViewController

#pragma mark -
#pragma mark Accessors

TSYBaseViewPropertyGetterSynthesize(TSYTableView, mainView)

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    
    [refreshControl addTarget:self
                       action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    
    NSMutableAttributedString *refreshString = [[NSMutableAttributedString alloc] initWithString:kRefreshString];

    refreshControl.attributedTitle = refreshString;
    
    self.refreshControl = refreshControl;
    
    [self.mainView.tableView addSubview:refreshControl];
}

#pragma mark -
#pragma mark Public Methods

- (void)performRefreshing {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelWillLoad:(TSYContext *)context {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView showLoadingView];
    });
}

- (void)modelDidLoad:(TSYContext *)context {
    TSYTableView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

#pragma mark -
#pragma mark Private Methods

- (void)refresh {
    [self performRefreshing];
    
    [self.refreshControl endRefreshing];
}

@end

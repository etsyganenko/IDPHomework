//
//  TSYTableViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableViewController.h"

#import "TSYTableView.h"

#import "TSYMacros.h"

@interface TSYTableViewController ()
@property (nonatomic, readonly)   TSYTableView  *mainView;

@end

@implementation TSYTableViewController

@dynamic mainView;

#pragma mark -
#pragma mark Accessors

TSYBaseViewPropertyGetter(TSYTableView, mainView)

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

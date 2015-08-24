//
//  TSYSimpleTableViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYUsers.h"

@class TSYUsers;
@class TSYSimpleTableView;

@interface TSYSimpleTableViewController : UIViewController<UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        TSYModelObserver>
@property (nonatomic, strong)   TSYUsers    *users;

- (IBAction)onButtonAdd:(id)sender;
- (IBAction)onButtonEdit:(id)sender;
- (IBAction)onButtonUp:(id)sender;

@end

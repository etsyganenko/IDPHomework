//
//  TSYTableViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYUsers;
@class TSYTableView;

@interface TSYTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   TSYUsers    *users;

- (IBAction)onButtonAdd:(id)sender;
- (IBAction)onButtonEdit:(id)sender;

@end

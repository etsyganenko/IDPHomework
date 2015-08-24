//
//  TSYTableViewController.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/21/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

@class TSYTableView;

@interface TSYTableViewController : TSYViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, readonly)     TSYTableView        *mainView;
@property (nonatomic, strong)       UIRefreshControl    *refreshControl;

@end

//
//  TSYTableView.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYUsers;

@interface TSYTableView : UIView
@property (nonatomic, strong)   IBOutlet UITableView    *tableView;

@property (nonatomic, strong)   TSYUsers                *users;

- (void)fillWithUsers:(TSYUsers *)users;

@end

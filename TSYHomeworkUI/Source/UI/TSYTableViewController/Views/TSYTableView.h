//
//  TSYTableView.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYView.h"

@class TSYUsers;

@interface TSYTableView : TSYView
@property (nonatomic, strong)   IBOutlet UITableView        *tableView;

@property (nonatomic, strong)   IBOutlet UIButton           *addButton;
@property (nonatomic, strong)   IBOutlet UIButton           *editButton;
@property (nonatomic, strong)   IBOutlet UIButton           *upButton;

@property (nonatomic, assign, getter=isEditing)     BOOL    editing;

- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

@end

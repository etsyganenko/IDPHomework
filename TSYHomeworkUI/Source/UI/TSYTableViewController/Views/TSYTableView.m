//
//  TSYTableView.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableView.h"
#import "TSYLoadingView.h"
#import "UINib+TSYCategory.h"

#import "TSYUsers.h"
#import "TSYUser.h"

static NSString * const kDone    = @"Done";
static NSString * const kEdit    = @"Edit";

@implementation TSYTableView

@dynamic editing;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingView = [TSYLoadingView loadingViewWithSuperview:self];
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isEditing {
    return self.tableView.editing;
}

- (void)setEditing:(BOOL)editing {
    [self setEditing:editing animated:NO];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [self.tableView setEditing:editing animated:animated];
    
    [self.editButton setTitle:editing ? kDone : kEdit
                     forState:UIControlStateNormal];
}

@end

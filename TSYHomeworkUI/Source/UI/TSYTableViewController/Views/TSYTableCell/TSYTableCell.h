//
//  TSYTableCell.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYTableViewCell.h"
#import "TSYModel.h"

@class TSYUser;
@class TSYImageView;

@interface TSYTableCell : UITableViewCell <TSYModelObserver>
@property (nonatomic, strong)   IBOutlet TSYImageView   *userImageView;
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;

@property (nonatomic, strong)   TSYUser                 *user;

- (void)fillWithUser:(TSYUser *)user;

@end

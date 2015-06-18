//
//  TSYTableCellView.h
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYUser;

@interface TSYTableCellView : UITableViewCell
@property (nonatomic, strong)   IBOutlet UIImageView    *userImageView;
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;

@property (nonatomic, strong)   TSYUser                 *user;

- (void)fillWithUser:(TSYUser *)user;

@end

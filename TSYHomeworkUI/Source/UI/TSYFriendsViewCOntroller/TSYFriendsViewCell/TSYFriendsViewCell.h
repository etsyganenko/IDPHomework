//
//  TSYFriendsViewCell.h
//  TSYHomeworkUI
//
//  Created by Admin on 29.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYModel.h"

@class TSYImageView;
@class TSYFBUserModel;
@class TSYFacebookUserInfoContext;

@interface TSYFriendsViewCell : UITableViewCell <TSYModelObserver>
@property (nonatomic, strong)   IBOutlet TSYImageView       *friendImageView;
@property (nonatomic, strong)   IBOutlet UILabel            *fullNameLabel;

@property (nonatomic, strong)   TSYFBUserModel              *model;

- (void)fillWithModel:(TSYFBUserModel *)model;

@end

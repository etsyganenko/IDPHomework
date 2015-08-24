//
//  TSYSimpleTableCell.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYSimpleTableCell.h"

#import "TSYUser.h"
#import "TSYImageView.h"
#import "TSYImageModel.h"

@implementation TSYSimpleTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)fillWithUser:(TSYUser *)user {
    self.fullNameLabel.text = user.fullName;
    self.userImageView.imageModel = user.imageModel;
}

- (void)setUser:(TSYUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithUser:user];
    }
}

@end

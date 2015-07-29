//
//  TSYFriendsViewCell.m
//  TSYHomeworkUI
//
//  Created by Admin on 29.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFriendsViewCell.h"

#import "TSYFBUserModel.h"
#import "TSYImageView.h"
#import "TSYFacebookUserInfoContext.h"
#import "TSYImageModel.h"
#import "TSYModel.h"

@implementation TSYFriendsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBUserModel *)model {
    self.fullNameLabel.text = model.name;
    
    [self.friendImageView setImageModel:model.imageModel];
}

@end

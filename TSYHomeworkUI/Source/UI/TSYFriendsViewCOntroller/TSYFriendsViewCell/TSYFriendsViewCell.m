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

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBUserModel *)model {
    self.fullNameLabel.text = model.fullName;
    
    self.friendImageView.imageModel = model.imageModel;
}

@end

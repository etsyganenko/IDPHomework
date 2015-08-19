//
//  TSYFriendsViewCell.m
//  TSYHomeworkUI
//
//  Created by Admin on 29.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFriendsViewCell.h"

#import "TSYFBUser.h"
#import "TSYImageView.h"
#import "TSYFacebookUserInfoContext.h"
#import "TSYImageModel.h"
#import "TSYModel.h"

@implementation TSYFriendsViewCell

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBUser *)userModel {
    self.fullNameLabel.text = userModel.fullName;
    
    NSURL *imageURL = userModel.imageUrl;
    
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:imageURL];
    
    self.friendImageView.imageModel = imageModel;
}

@end

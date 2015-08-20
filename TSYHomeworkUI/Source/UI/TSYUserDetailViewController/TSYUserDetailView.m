//
//  TSYUserDetailView.m
//  TSYHomeworkUI
//
//  Created by Admin on 23.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUserDetailView.h"

#import "TSYFBUser.h"
#import "TSYImageModel.h"

@implementation TSYUserDetailView

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBUser *)userModel {
    self.IDLabel.text = userModel.ID;
    self.fullNameLabel.text = userModel.fullName;
    
    NSURL *imageUrl = userModel.imageUrl;
    
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:imageUrl];
    
    self.userImageView.imageModel = imageModel;
}

@end

//
//  TSYUserDetailView.m
//  TSYHomeworkUI
//
//  Created by Admin on 23.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUserDetailView.h"

#import "TSYFBUserModel.h"
#import "TSYImageModel.h"

@implementation TSYUserDetailView

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBUserModel *)model {
    self.IDLabel.text = model.userID;
    self.fullNameLabel.text = model.fullName;
    
    NSURL *imageUrl = model.imageUrl;
    
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:imageUrl];
    
    self.userImageView.imageModel = imageModel;
}

@end

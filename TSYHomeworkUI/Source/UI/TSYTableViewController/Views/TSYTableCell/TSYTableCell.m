//
//  TSYTableCell.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableCell.h"

#import "TSYUser.h"
#import "TSYImageView.h"
#import "TSYImageModel.h"

@implementation TSYTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)fillWithUser:(TSYUser *)user {
    self.fullNameLabel.text = user.fullName;
    self.userImageView.image = user.imageModel.image;
}

- (void)setUser:(TSYUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        
        _user = user;
        
        [_user addObserver:self];
        
        [_user load];
    }
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelWillLoad:(TSYUser *)user {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.userImageView showLoadingView];
    });
}

- (void)modelDidLoad:(TSYUser *)user {
    TSYImageView *imageView = self.userImageView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [imageView hideLoadingView];
        
        [self fillWithUser:user];
    });
}

- (void)modelDidFailLoading:(TSYUser *)user {
    [self.user load];
}

@end

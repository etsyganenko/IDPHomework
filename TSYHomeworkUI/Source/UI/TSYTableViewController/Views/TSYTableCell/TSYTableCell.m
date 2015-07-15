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
//    self.userImageView.imageModel = user.imageModel;
    self.userImageView.imageModel = [TSYImageModel imageModelWithURL:[NSURL URLWithString:@"https://d1u1p2xjjiahg3.cloudfront.net/30916648-2ea7-494f-8ceb-5aa2bb1b98b6.jpg"]];
}

- (void)setUser:(TSYUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithUser:user];
    }
}

@end

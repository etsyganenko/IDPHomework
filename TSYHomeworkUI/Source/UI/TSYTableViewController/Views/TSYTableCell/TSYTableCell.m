//
//  TSYTableCell.m
//  TSYHomeworkUI
//
//  Created by Admin on 17.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableCell.h"

#import "TSYUser.h"

@implementation TSYTableCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)fillWithUser:(TSYUser *)user {
    self.fullNameLabel.text = user.fullName;
    
    self.user = user;
}

- (void)setUser:(TSYUser *)user {
    if (_user != user) {
        _user = user;
    }
    
    
}

@end

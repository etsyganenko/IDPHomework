//
//  TSYUserDetailView.m
//  TSYHomeworkUI
//
//  Created by Admin on 23.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUserDetailView.h"

#import "TSYFBUserModel.h"

@implementation TSYUserDetailView

- (void)fillWithModel:(TSYFBUserModel *)model {
    self.fullNameLabel.text = model.name;
}

@end

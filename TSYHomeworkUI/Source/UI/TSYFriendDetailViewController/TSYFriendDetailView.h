//
//  TSYFriendDetailView.h
//  TSYHomeworkUI
//
//  Created by Admin on 23.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

#import "TSYImageView.h"

@class TSYFBUserModel;

@interface TSYFriendDetailView : TSYView
@property (nonatomic, strong)   IBOutlet TSYImageView   *userImageView;
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;

- (void)fillWithModel:(TSYFBUserModel *)model;

@end

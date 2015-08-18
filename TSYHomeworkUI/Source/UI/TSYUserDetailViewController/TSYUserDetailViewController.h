//
//  TSYUserDetailViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

@interface TSYUserDetailViewController : TSYViewController
@property (nonatomic, strong)       NSString        *userID;

- (IBAction)onFriendsButton:(id)sender;
- (IBAction)onPhotosButton:(id)sender;

@end

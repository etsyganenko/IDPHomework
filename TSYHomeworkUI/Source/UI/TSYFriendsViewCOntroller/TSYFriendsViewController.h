//
//  TSYFriendsViewController.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

#import "TSYFBUserModel.h"

@interface TSYFriendsViewController : TSYViewController <UITableViewDelegate,
                                                            UITableViewDataSource,
                                                            TSYFBUserModelObserver>

@end

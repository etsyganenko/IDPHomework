//
//  TSYAlbumPhotosViewController.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

@interface TSYAlbumPhotosViewController : TSYViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   NSString    *albumID;

@end

//
//  TSYAlbumViewCell.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYImageView;
@class TSYFBPhotoModel;

@interface TSYAlbumViewCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet TSYImageView       *photoImageView;

- (void)fillWithModel:(TSYFBPhotoModel *)model;

@end
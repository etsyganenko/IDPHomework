//
//  TSYAlbumsViewCell.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYImageView.h"

@class TSYFBUserAlbumModel;

@interface TSYAlbumsViewCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet TSYImageView       *photoImageView;

@property (nonatomic, strong)   IBOutlet UILabel            *albumNameLabel;
@property (nonatomic, strong)   IBOutlet UILabel            *albumPhotosCountLabel;

- (void)fillWithModel:(TSYFBUserAlbumModel *)albumModel;

@end

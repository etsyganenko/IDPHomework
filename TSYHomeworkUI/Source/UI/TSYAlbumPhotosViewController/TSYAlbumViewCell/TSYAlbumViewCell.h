//
//  TSYAlbumViewCell.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYImageView;
@class TSYFBPhoto;

@interface TSYAlbumViewCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet TSYImageView       *photoImageView;

- (void)fillWithModel:(TSYFBPhoto *)photoModel;

@end

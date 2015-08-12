//
//  TSYPhotosViewCell.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYImageView.h"

@interface TSYPhotosViewCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet TSYImageView       *photoImageView;

- (void)fillWithModel:(TSYImageModel *)model;

@end

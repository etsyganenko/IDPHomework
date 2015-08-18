//
//  TSYFBPhotoAlbumModel.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYModel.h"

@class TSYImageModel;
@class TSYArrayModel;

@interface TSYFBPhotoAlbumModel : TSYModel
@property (nonatomic, strong)   NSString                *albumID;
@property (nonatomic, strong)   NSString                *albumName;

//@property (nonatomic, strong)   TSYImageModel           *albumCoverPhoto;

//@property (nonatomic, strong)   NSString                *albumCoverPhotoID;
@property (nonatomic, strong)   NSURL                   *albumCoverPhotoURL;

@property (nonatomic, strong)   TSYArrayModel           *photos;

@end

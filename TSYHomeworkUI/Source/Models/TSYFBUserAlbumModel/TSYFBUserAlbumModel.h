//
//  TSYFBUserAlbumModel.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYModel.h"

@interface TSYFBUserAlbumModel : TSYModel
@property (nonatomic, strong)   NSString    *albumID;
@property (nonatomic, strong)   NSString    *albumCoverPhotoID;
@property (nonatomic, strong)   NSURL       *albumCoverPhotoURL;

@property (nonatomic, strong)   NSMutableDictionary     *photos;

@end

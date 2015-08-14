//
//  TSYFacebookAlbumCoverPhotoURLContext.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookContext.h"

@class TSYFacebookAlbumIDContext;
@class TSYFacebookAlbumCoverPhotoIDContext;

@interface TSYFacebookAlbumCoverPhotoURLContext : TSYFacebookContext
@property (nonatomic, strong)   TSYFacebookAlbumIDContext               *albumIDContext;
@property (nonatomic, strong)   TSYFacebookAlbumCoverPhotoIDContext     *albumCoverPhotoIDContext;

@property (nonatomic, strong)   NSMutableArray                          *albumCoverPhotoIDContexts;

@end

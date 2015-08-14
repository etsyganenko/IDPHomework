//
//  TSYFacebookAlbumsContext.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookContext.h"

@class TSYFacebookAlbumIDContext;

@interface TSYFacebookAlbumsContext : TSYContext
@property (nonatomic, strong)   TSYFacebookAlbumIDContext   *albumIDContext;

@property (nonatomic, strong)   NSMutableArray              *albumCoverPhotoIDContexts;
@property (nonatomic, strong)   NSMutableArray              *albumCoverPhotoURLContexts;

@end

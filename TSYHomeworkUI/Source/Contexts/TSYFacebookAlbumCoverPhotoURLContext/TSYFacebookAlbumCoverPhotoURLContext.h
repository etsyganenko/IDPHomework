//
//  TSYFacebookAlbumCoverPhotoURLContext.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookContext.h"

@class TSYFacebookAlbumIDContext;

@interface TSYFacebookAlbumCoverPhotoURLContext : TSYFacebookContext
//@property (nonatomic, strong)   NSString                    *albumID;

@property (nonatomic, strong)   TSYFacebookAlbumIDContext   *albumIDContext;

@end

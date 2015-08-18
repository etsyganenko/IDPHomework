//
//  TSYFacebookAlbumPhotosContext.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookContext.h"

@interface TSYFacebookAlbumPhotosContext : TSYFacebookContext
@property (nonatomic, strong)       NSString    *albumID;
@property (nonatomic, readonly)     NSArray     *photos;

@end

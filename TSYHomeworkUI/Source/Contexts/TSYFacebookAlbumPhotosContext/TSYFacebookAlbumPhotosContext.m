//
//  TSYFacebookAlbumPhotosContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumPhotosContext.h"

#import "TSYFBUserAlbumModel.h"
#import "TSYFBPhotoModel.h"
#import "TSYArrayModel.h"
#import "TSYFacebookAlbumPhotosIDContext.h"
#import "TSYFacebookAlbumPhotosURLContext.h"

@interface TSYFacebookAlbumPhotosContext ()
@property (nonatomic, assign)   NSUInteger  loadedURLsCount;

@end

@implementation TSYFacebookAlbumPhotosContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self) {
        TSYFacebookAlbumPhotosIDContext *context = [TSYFacebookAlbumPhotosIDContext contextWithModel:model];
        
        [self addContext:context];
    }
    
    return self;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidFailLoading:(TSYContext *)context {
    
}

- (void)modelDidLoad:(TSYContext *)context {
    TSYFBUserAlbumModel *albumModel = self.model;
    TSYArrayModel *photos = albumModel.photos;
    NSUInteger photosCount = photos.count;
    
    if ([context isMemberOfClass:[TSYFacebookAlbumPhotosIDContext class]]) {
        for (NSUInteger index = 0; index < photosCount; index++) {
            TSYFBPhotoModel *photoModel = photos[index];
            
            TSYFacebookAlbumPhotosURLContext *context = [TSYFacebookAlbumPhotosURLContext contextWithModel:photoModel];
            
            [self addContext:context];
        }
    }
    
    if ([context isMemberOfClass:[TSYFacebookAlbumPhotosURLContext class]]) {
        self.loadedURLsCount += 1;
        
        if (photosCount == self.loadedURLsCount) {
            albumModel.state = TSYModelDidLoad;
        }
    }
}

@end

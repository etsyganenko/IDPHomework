//
//  TSYFacebookAlbumsContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumsContext.h"

#import "TSYFBUserModel.h"
#import "TSYFBUserAlbumModel.h"
#import "TSYArrayModel.h"
#import "TSYFacebookAlbumIDContext.h"
#import "TSYFacebookAlbumCoverPhotoIDContext.h"
#import "TSYFacebookAlbumCoverPhotoURLContext.h"
#import "TSYFacebookConstants.h"

@interface TSYFacebookAlbumsContext ()

- (void)addFacebookAlbumCoverPhotoContext:(TSYFacebookAlbumCoverPhotoIDContext *)context;

@end

@implementation TSYFacebookAlbumsContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self) {
        self.albumCoverPhotoIDContexts = [NSMutableArray array];
        self.albumIDContext = [TSYFacebookAlbumIDContext contextWithModel:model];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setAlbumIDContext:(TSYFacebookAlbumIDContext *)albumIDContext {
    if (_albumIDContext != albumIDContext) {
        [_albumIDContext cancel];
        [_albumIDContext removeObserver:self];
        
        _albumIDContext = albumIDContext;
        
        if (albumIDContext) {
            _albumIDContext.model = self.model;
            [_albumIDContext addObserver:self];
            
            [_albumIDContext execute];
        }
    }
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidFailLoading:(TSYContext *)context {
    
}

- (void)modelDidLoad:(TSYContext *)context {
    if ([context isMemberOfClass:[TSYFacebookAlbumIDContext class]]) {        
        TSYFBUserModel *userModel = self.model;
        NSUInteger albumsCount = userModel.albums.count;
        
        for (NSUInteger index = 0; index < albumsCount; index++) {
            TSYFBUserAlbumModel *albumModel = userModel.albums[index];
            
            TSYFacebookAlbumCoverPhotoIDContext *context = [TSYFacebookAlbumCoverPhotoIDContext contextWithModel:albumModel];
            
            [self addFacebookAlbumCoverPhotoIDContext:context];
        }
    }
    
    if ([context isMemberOfClass:[TSYFacebookAlbumCoverPhotoIDContext class]]) {
        TSYFBUserAlbumModel *albumModel = context.model;
        
        TSYFacebookAlbumCoverPhotoURLContext *context = [TSYFacebookAlbumCoverPhotoURLContext contextWithModel:albumModel];
            
        [self addFacebookAlbumCoverPhotoURLContext:context];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)addFacebookAlbumCoverPhotoIDContext:(TSYFacebookAlbumCoverPhotoIDContext *)context {
    [self.albumCoverPhotoIDContexts addObject:context];
    
    [context addObserver:self];
        
    [context execute];
}

- (void)addFacebookAlbumCoverPhotoURLContext:(TSYFacebookAlbumCoverPhotoURLContext *)context {
    [self.albumCoverPhotoURLContexts addObject:context];
    
    [context addObserver:self];
    
    [context execute];
}

@end

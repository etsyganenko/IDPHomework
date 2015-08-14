//
//  TSYFacebookAlbumCoverPhotoURLContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumCoverPhotoURLContext.h"

#import "TSYFBUserModel.h"
#import "TSYFacebookAlbumIDContext.h"
#import "TSYFacebookAlbumCoverPhotoIDContext.h"
#import "TSYFacebookConstants.h"

@interface TSYFacebookAlbumCoverPhotoURLContext ()

- (void)addFacebookAlbumCoverPhotoContext:(TSYFacebookAlbumCoverPhotoIDContext *)context;

@end

@implementation TSYFacebookAlbumCoverPhotoURLContext

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

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    return [NSString stringWithFormat:kAlbumCoverPhotoGraphPath, model.ID];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidFailLoading:(TSYContext *)context {
    
}

- (void)modelDidLoad:(TSYContext *)context {
    if ([context isMemberOfClass:[TSYFacebookAlbumIDContext class]]) {        
        TSYFBUserModel *model = self.model;
        NSUInteger count = model.albumIDs.count;
        
        for (NSUInteger index = 0; index < count; index++) {
            TSYFacebookAlbumCoverPhotoIDContext *context = [TSYFacebookAlbumCoverPhotoIDContext contextWithModel:model];
            context.index = index;
            
            [self addFacebookAlbumCoverPhotoContext:context];
        }
    }
    
    if ([context isMemberOfClass:[TSYFacebookAlbumCoverPhotoIDContext class]]) {
        NSLog(@"%@", self.model);
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)addFacebookAlbumCoverPhotoContext:(TSYFacebookAlbumCoverPhotoIDContext *)context {
    [self.albumCoverPhotoIDContexts addObject:context];
    
    [context addObserver:self];
        
    [context execute];
}

@end

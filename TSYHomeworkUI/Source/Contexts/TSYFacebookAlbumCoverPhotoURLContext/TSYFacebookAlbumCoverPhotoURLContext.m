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
#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumCoverPhotoURLContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.albumIDContext = [TSYFacebookAlbumIDContext new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setAlbumIDContext:(TSYFacebookAlbumIDContext *)albumIDContext {
    if (_albumIDContext != albumIDContext) {
        [_albumIDContext cancel];
        
        _albumIDContext = albumIDContext;
        
        if (albumIDContext) {
            _albumIDContext.model = self.model;
            
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
    
}

#pragma mark -
#pragma mark TSYObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYModelDidLoad:
            return @selector(modelDidLoad:);
            
        case TSYModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        default:
            return [super selectorForState:state];;
    }
}

@end

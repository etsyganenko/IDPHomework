//
//  TSYFacebookAlbumPhotosContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumPhotosContext.h"

#import "TSYFBUserAlbumModel.h"
#import "TSYFacebookAlbumPhotosIDContext.h"

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
    
}

@end

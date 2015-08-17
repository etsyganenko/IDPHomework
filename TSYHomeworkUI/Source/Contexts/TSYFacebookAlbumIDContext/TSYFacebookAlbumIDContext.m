//
//  TSYFacebookAlbumIDContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumIDContext.h"

#import "TSYFBUserModel.h"
#import "TSYImageModel.h"
#import "TSYArrayModel.h"
#import "TSYFBUserAlbumModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumIDContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    return [NSString stringWithFormat:kAlbumNameIDContextGraphPath, model.ID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *userModel = self.model;
    TSYArrayModel *albums = userModel.albums;
    
    [albums removeAllModels];
    
    NSArray *data = result[kDataKey];
    NSUInteger albumsCount = data.count;
    
    for (NSUInteger index = 0; index < albumsCount; index++) {
        NSDictionary *dictionary = data[index];
        NSString *albumID = dictionary[kIDKey];
        NSString *albumName = dictionary[kNameKey];
        
        TSYFBUserAlbumModel *album = [TSYFBUserAlbumModel new];
        album.albumID = albumID;
        album.albumName = albumName;
        
        [albums addModel:album];
    }
}

- (void)processRequestResult:(id)result error:(NSError *)error {
    if (error) {
        self.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    self.state = TSYModelDidLoad;
}

@end

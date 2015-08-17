//
//  TSYFacebookAlbumPhotosIDContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumPhotosIDContext.h"

#import "TSYFBUserAlbumModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumPhotosIDContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserAlbumModel *model = self.model;
    
    return [NSString stringWithFormat:kAlbumPhotosGraphPath, model.albumID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {

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

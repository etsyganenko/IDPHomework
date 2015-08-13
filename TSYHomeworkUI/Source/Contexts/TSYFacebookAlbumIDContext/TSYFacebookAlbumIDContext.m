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
#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumIDContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    return [NSString stringWithFormat:kAlbumIDContextGraphPath, model.ID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *model = self.model;
    NSMutableArray *albumIDs = model.albumIDs;
    
    NSArray *data = result[@"data"];
    
    for (NSUInteger index = 0; index < data.count; index++) {
        NSDictionary *dictionary = data[index];

        [albumIDs addObject:dictionary[@"id"]];
    }
}

- (void)processRequestResult:(id)result error:(NSError *)error {
    TSYFBUserModel *model = self.model;
    if (error) {
        model.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    model.state = TSYModelDidLoad;
}

@end

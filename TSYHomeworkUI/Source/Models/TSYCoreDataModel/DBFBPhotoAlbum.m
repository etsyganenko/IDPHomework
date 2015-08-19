//
//  DBFBPhotoAlbum.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "DBFBPhotoAlbum.h"
#import "DBFBPhoto.h"
#import "DBUser.h"

@interface DBFBPhotoAlbum ()
@property (nonatomic, strong)   NSString    *coverPhotoURLString;

@end

@implementation DBFBPhotoAlbum

@dynamic albumID;
@dynamic albumName;
@dynamic coverPhotoURLString;
@dynamic coverPhotoURL;
@dynamic photos;
@dynamic user;

- (NSURL *)coverPhotoURL {
    return [NSURL URLWithString:self.coverPhotoURLString];
}

@end

//
//  DBFBPhoto.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "DBFBPhoto.h"

#import "DBFBPhotoAlbum.h"

@interface DBFBPhoto ()
@property (nonatomic, strong)   NSString        *photoURLString;

@end

@implementation DBFBPhoto

@dynamic photoURL;
@dynamic photoURLString;
@dynamic photoID;
@dynamic photoAlbum;

- (NSURL *)photoURL {
    return [NSURL URLWithString:self.photoURLString];
}

@end

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

@dynamic photoURLString;
@dynamic photoID;
@dynamic photoAlbum;

#pragma mark -
#pragma mark Accessors

- (NSURL *)photoURL {
    return [NSURL URLWithString:self.photoURLString];
}

- (void)setPhotoURL:(NSURL *)photoURL {
    self.photoURLString = [NSString stringWithContentsOfURL:photoURL
                                                   encoding:0
                                                      error:nil];
}

@end

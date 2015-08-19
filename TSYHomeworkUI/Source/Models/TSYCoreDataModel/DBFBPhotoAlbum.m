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

#import "NSManagedObject+IDPExtensions.h"

@interface DBFBPhotoAlbum ()
@property (nonatomic, strong)   NSString    *coverPhotoURLString;

@end

@implementation DBFBPhotoAlbum

@dynamic albumID;
@dynamic albumName;
@dynamic coverPhotoURLString;
@dynamic photos;
@dynamic user;

#pragma mark -
#pragma mark Accessors

- (NSURL *)coverPhotoURL {
    return [NSURL URLWithString:self.coverPhotoURLString];
}

- (void)setCoverPhotoURL:(NSURL *)coverPhotoURL {
    self.coverPhotoURLString = [NSString stringWithContentsOfURL:coverPhotoURL
                                                        encoding:0
                                                           error:nil];
}

#pragma mark -
#pragma mark Public Methods

- (void)addPhoto:(DBFBPhoto *)photo {
    [self setCustomValue:photo forKey:NSStringFromSelector(@selector(photo))];
}

- (void)removePhoto:(DBFBPhoto *)photo {
    [self removeCustomValue:photo inMutableSetForKey:NSStringFromSelector(@selector(photo))];
}

@end

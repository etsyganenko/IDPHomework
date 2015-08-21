//
//  DBUser.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFBUser.h"

#import "ActiveRecordKit.h"
#import "TSYFBPhotoAlbum.h"
#import "TSYFBUser.h"
#import "TSYFacebookConstants.h"

@interface TSYFBUser ()
@property (nonatomic, strong)   NSString                *imageURLString;

@end

@interface TSYFBUser (CoreDataGeneratedAccessors)

- (void)addPhotoAlbumsObject:(TSYFBPhotoAlbum *)value;
- (void)removePhotoAlbumsObject:(TSYFBPhotoAlbum *)value;

- (void)addPhotoAlbums:(NSSet *)values;
- (void)removePhotoAlbums:(NSSet *)values;

- (void)addFriendsObject:(TSYFBUser *)value;
- (void)removeFriendsObject:(TSYFBUser *)value;

- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

@end

@implementation TSYFBUser

@dynamic firstName;
@dynamic lastName;
@dynamic fullName;
@dynamic photoAlbums;
@dynamic friends;
@dynamic imageURLString;

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSURL *)imageUrl {
    return [NSURL URLWithString:self.imageURLString];
}

- (void)setImageUrl:(NSURL *)imageUrl {
    self.imageURLString = [imageUrl absoluteString];
}

#pragma mark -
#pragma mark Public Methods

- (void)addPhotoAlbum:(TSYFBPhotoAlbum *)photoAlbum {
    [self addPhotoAlbumsObject:photoAlbum];
}

- (void)removePhotoAlbum:(TSYFBPhotoAlbum *)photoAlbum {
    [self removePhotoAlbumsObject:photoAlbum];
}

- (void)addFriend:(TSYFBUser *)friend {
    [self addFriendsObject:friend];
}

- (void)removeFriend:(TSYFBUser *)friend {
    [self removeFriendsObject:friend];
}

- (void)fillWithDictionary:(NSDictionary *)friendDictionary {
    self.firstName = friendDictionary[kFirstNameKey];
    self.lastName = friendDictionary[kLastNameKey];
    self.imageUrl = [NSURL URLWithString:friendDictionary[kPictureKey][kDataKey][kURLKey]];
}

@end

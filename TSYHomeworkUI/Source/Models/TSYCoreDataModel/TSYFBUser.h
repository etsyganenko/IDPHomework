//
//  TSYFBUser.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "TSYManagedObject.h"

@class TSYFBPhotoAlbum;
@class TSYFBUser;

@interface TSYFBUser : TSYManagedObject
@property (nonatomic, strong)   NSString        *firstName;
@property (nonatomic, strong)   NSString        *lastName;
@property (nonatomic, readonly) NSString        *fullName;

@property (nonatomic, strong)   NSURL           *imageUrl;

@property (nonatomic, strong)   NSOrderedSet    *photoAlbums;
@property (nonatomic, strong)   NSOrderedSet    *friends;

- (void)addPhotoAlbum:(TSYFBPhotoAlbum *)photoAlbum;
- (void)removePhotoAlbum:(TSYFBPhotoAlbum *)photoAlbum;

- (void)addFriend:(TSYFBUser *)friend;
- (void)removeFriend:(TSYFBUser *)friend;

@end

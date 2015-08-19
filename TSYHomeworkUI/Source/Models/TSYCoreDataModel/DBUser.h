//
//  DBUser.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBFBPhotoAlbum;
@class DBUser;

@interface DBUser : NSManagedObject
@property (nonatomic, strong)   NSString    *userID;
@property (nonatomic, strong)   NSString    *firstName;
@property (nonatomic, strong)   NSString    *lastName;
@property (nonatomic, readonly) NSString    *fullName;

@property (nonatomic, strong) 	NSSet       *photoAlbums;
@property (nonatomic, strong)   NSSet       *friends;

@end

@interface DBUser (CoreDataGeneratedAccessors)

- (void)addPhotoAlbumsObject:(DBFBPhotoAlbum *)value;
- (void)removePhotoAlbumsObject:(DBFBPhotoAlbum *)value;
- (void)addPhotoAlbums:(NSSet *)values;
- (void)removePhotoAlbums:(NSSet *)values;

- (void)addFriendsObject:(DBUser *)value;
- (void)removeFriendsObject:(DBUser *)value;
- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

@end

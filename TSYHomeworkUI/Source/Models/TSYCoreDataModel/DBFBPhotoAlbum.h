//
//  DBFBPhotoAlbum.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBFBPhoto;
@class DBUser;

@interface DBFBPhotoAlbum : NSManagedObject
@property (nonatomic, strong)   NSString    *albumID;
@property (nonatomic, strong)   NSString    *albumName;
@property (nonatomic, strong)   NSURL       *coverPhotoURL;

@property (nonatomic, strong)   NSSet       *photos;

@property (nonatomic, strong)   DBUser      *user;

@end

@interface DBFBPhotoAlbum (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(DBFBPhoto *)value;
- (void)removePhotosObject:(DBFBPhoto *)value;

- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

@end

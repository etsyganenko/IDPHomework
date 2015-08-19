//
//  TSYFBPhotoAlbum.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "TSYManagedObject.h"

@class TSYFBPhoto;
@class DBUser;

@interface TSYFBPhotoAlbum : TSYManagedObject
@property (nonatomic, strong)   NSString        *albumName;
@property (nonatomic, strong)   NSURL           *coverPhotoURL;

@property (nonatomic, strong)   NSOrderedSet    *photos;

@property (nonatomic, strong)   DBUser          *user;

- (void)addPhoto:(TSYFBPhoto *)photo;
- (void)removePhoto:(TSYFBPhoto *)photo;

@end

@interface TSYFBPhotoAlbum (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(TSYFBPhoto *)value;
- (void)removePhotosObject:(TSYFBPhoto *)value;

- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

@end

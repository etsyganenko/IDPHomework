//
//  DBFBPhoto.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBFBPhotoAlbum;

@interface DBFBPhoto : NSManagedObject
@property (nonatomic, strong)   NSURL           *photoURL;
@property (nonatomic, strong)   NSString        *photoID;

@property (nonatomic, strong)   DBFBPhotoAlbum  *photoAlbum;

@end

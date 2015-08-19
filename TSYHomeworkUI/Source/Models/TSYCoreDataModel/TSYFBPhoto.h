//
//  TSYFBPhoto.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "TSYManagedObject.h"

@class TSYFBPhotoAlbum;

@interface TSYFBPhoto : TSYManagedObject
@property (nonatomic, strong)   NSURL           *photoURL;

@property (nonatomic, strong)   TSYFBPhotoAlbum  *photoAlbum;

@end

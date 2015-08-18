//
//  TSYFBUserModel.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYModel.h"

@class TSYArrayModel;
@class TSYImageModel;
@class TSYFBPhotoAlbumModel;

@interface TSYFBUserModel : TSYModel
@property (nonatomic, strong)       NSString        *userID;
@property (nonatomic, strong)       NSString        *firstName;
@property (nonatomic, strong)       NSString        *lastName;
@property (nonatomic, readonly)     NSString        *fullName;

@property (nonatomic, strong)       NSURL           *imageUrl;
@property (nonatomic, readonly)     TSYImageModel   *imageModel;

@property (nonatomic, strong)       NSMutableArray  *friends;
@property (nonatomic, strong)       NSMutableArray  *photoAlbums;

@end

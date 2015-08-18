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
@property (nonatomic, strong)       NSString        *name;
@property (nonatomic, strong)       NSString        *surname;
@property (nonatomic, readonly)     NSString        *fullName;

@property (nonatomic, strong)       NSURL           *imageUrl;
@property (nonatomic, readonly)     TSYImageModel   *imageModel;

@property (nonatomic, readonly)     TSYArrayModel   *friends;
@property (nonatomic, readonly)     TSYArrayModel   *albums;

@end

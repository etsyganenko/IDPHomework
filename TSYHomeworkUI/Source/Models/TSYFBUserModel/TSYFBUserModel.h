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

@interface TSYFBUserModel : TSYModel
@property (nonatomic, strong)       NSString        *ID;
@property (nonatomic, strong)       NSString        *name;
@property (nonatomic, strong)       NSString        *surname;
@property (nonatomic, strong)       NSURL           *imageUrl;
@property (nonatomic, readonly)     NSString        *fullName;
@property (nonatomic, readonly)     TSYImageModel   *imageModel;
@property (nonatomic, readonly)     TSYArrayModel   *friends;
@property (nonatomic, strong)       NSMutableArray  *albumIDs;
@property (nonatomic, strong)       NSMutableArray  *coverPhotoURLs;
@property (nonatomic, strong)       NSDictionary    *photoURLs;



@property (nonatomic, readonly)     TSYArrayModel   *albums;

@end

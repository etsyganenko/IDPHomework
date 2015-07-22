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
@property (nonatomic, readonly)     NSUInteger      ID;
@property (nonatomic, readonly)     NSString        *name;
@property (nonatomic, readonly)     NSString        *surname;
@property (nonatomic, readonly)     NSString        *fullName;
@property (nonatomic, readonly)     TSYImageModel   *imageModel;
@property (nonatomic, readonly)     TSYArrayModel   *friends;

@end

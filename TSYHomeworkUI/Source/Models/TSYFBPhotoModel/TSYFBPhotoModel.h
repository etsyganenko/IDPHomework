//
//  TSYFBPhotoModel.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYModel.h"

@class TSYImageModel;

@interface TSYFBPhotoModel : TSYModel
@property (nonatomic, strong)   NSString        *photoID;
@property (nonatomic, strong)   NSURL           *photoURL;

@end

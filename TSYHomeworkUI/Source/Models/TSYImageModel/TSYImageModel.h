//
//  TSYImageModel.h
//  TSYHomeworkUI
//
//  Created by Admin on 14.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYModel.h"

@interface TSYImageModel : TSYModel
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

@end

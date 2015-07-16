//
//  TSYImageModel.h
//  TSYHomeworkUI
//
//  Created by Admin on 14.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYModel.h"

@interface TSYImageModel : TSYModel
@property (nonatomic, readonly) NSURL       *url;
@property (nonatomic, readonly) UIImage     *image;

+ (instancetype)imageModelWithURL:(NSURL *)url;

- (void)cancel;

@end

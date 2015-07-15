//
//  TSYImageView.h
//  TSYHomeworkUI
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"
#import "TSYModel.h"

@class TSYImageModel;

@interface TSYImageView : TSYView <TSYModelObserver>
@property (nonatomic, strong)   IBOutlet UIImageView        *imageView;
@property (nonatomic, strong)   IBOutlet TSYImageModel      *imageModel;

@end

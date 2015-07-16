//
//  TSYImageView.m
//  TSYHomeworkUI
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYImageView.h"

#import "TSYImageModel.h"

@implementation TSYImageView

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(TSYImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        
        _imageModel = imageModel;
        
        [self fillWithModel:imageModel];
        
        [_imageModel addObserver:self];
        
        [_imageModel load];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithModel:(TSYImageModel *)model {
    self.imageView.image = model.image;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelWillLoad:(TSYImageModel *)imageModel {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showLoadingView];
    });
}

- (void)modelDidLoad:(TSYImageModel *)imageModel {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideLoadingView];
        
        [self fillWithModel:imageModel];
    });
}

- (void)modelDidFailLoading:(TSYModel *)model {
    [self.imageModel load];
}

@end

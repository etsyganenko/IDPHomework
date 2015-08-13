//
//  TSYFacebookUserPhotosContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookUserPhotosContext.h"

#import "TSYFBUserModel.h"
#import "TSYImageModel.h"
#import "TSYArrayModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYFacebookUserPhotosContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    return [NSString stringWithFormat:kUserPhotosContextGraphPath, model.ID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *model = self.model;
    TSYArrayModel *userPhotos = model.photos;
    
    NSLog(@"result: %@", result);
    
//    NSArray *images = result[@"data"][@"images"];
    
    NSArray *data = result[@"data"];
    
    for (NSUInteger i = 0; i < data.count; i++) {
        NSDictionary *dict = data[i];
        
        NSArray *array = dict[@"images"];
        
//        NSLog(@"dict: %@", dict);
    }
    
//    NSLog(@"images: %@", images);
    
//    for (NSUInteger i = 0; i < albums.count; i++) {
//        NSDictionary *albumsDictionary = albums[i];
//
//        NSArray *photos = albumsDictionary[@"photos"][@"data"];
//        
////        NSLog(@"photos: %@", photos);
//        
//        for (NSUInteger j = 0; j < photos.count; j++) {
//            NSDictionary *photosDictionary = photos[j];
//            
//            NSArray *images = photosDictionary[@"images"];
//            
//            for (NSUInteger k = 0; k < images.count; k++) {
//                NSDictionary *imagesDictionary = images[k];
//                
//                NSURL *url = imagesDictionary[@"source"];
//                TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:url];
//                
//                [userPhotos addModel:imageModel];
//            }
//        }
//    }
}

- (void)processRequestResult:(id)result error:(NSError *)error {
    TSYFBUserModel *model = self.model;
    if (error) {
        model.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    model.state = TSYModelDidLoad;
}

@end

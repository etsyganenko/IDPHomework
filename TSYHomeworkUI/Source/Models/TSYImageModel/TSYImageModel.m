//
//  TSYImageModel.m
//  TSYHomeworkUI
//
//  Created by Admin on 14.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYImageModel.h"

#import "TSYCache.h"

@interface TSYImageModel ()
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   UIImage     *image;

@property (nonatomic, strong)   TSYCache    *cache;

@end

@implementation TSYImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

- (void)performLoading {
    TSYCache *cache = self.cache;
    NSURL *url = self.url;
    
    if ([cache containsImageModelWithURL:url]) {
        self.image = [cache imageModelWithURL:url];
    } else {
        UIImage *image = [self imageFromURL];
        
//        [self.cache addImageModel:image withURL:self.url];
    }
}

- (id)imageFromURL {
    NSURL *url = self.url;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url
                                                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
                                                    self.state = TSYModelDidLoad;
                                                }];
    
    [task resume];
    return nil;
}

@end

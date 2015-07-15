//
//  TSYImageModel.m
//  TSYHomeworkUI
//
//  Created by Admin on 14.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYImageModel.h"

#import "TSYCache.h"

static NSString * const kIdentifier   = @"identifier";

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
    
    if ([cache containsImageWithURL:url]) {
        self.image = [cache imageWithURL:url];
    } else {
        UIImage *image = [self imageFromURL];
        
        [self.cache addImage:image withURL:self.url];
    }
}

- (id)imageFromURL {
    NSURL *url = self.url;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kIdentifier];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url];
    
    [task resume];
    
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
}

@end

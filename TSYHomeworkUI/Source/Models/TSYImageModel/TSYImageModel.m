//
//  TSYImageModel.m
//  TSYHomeworkUI
//
//  Created by Admin on 14.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYImageModel.h"

#import "TSYImageModelCache.h"
#import "TSYMacros.h"

#import "NSFileManager+TSYCategory.h"

static NSString * const kFileName       = @"image";

@interface TSYImageModel ()
@property (nonatomic, strong)   NSURLSession    *session;
@property (nonatomic, strong)   TSYImageModelCache        *cache;
@property (nonatomic, strong)   NSURL           *url;
@property (nonatomic, readonly) NSString        *fileName;
@property (nonatomic, strong)   UIImage         *image;
@property (nonatomic, readonly) NSString        *savingPath;

- (void)performDownloading;
- (void)cancel;

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
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        
        self.session = [NSURLSession sessionWithConfiguration:configuration];
        
        self.cache = [TSYImageModelCache sharedCache];
        [self.cache addImageModel:self withURL:url];
    }
    
    return self;
}

- (void)dealloc {
    [self.cache removeImageModelWithURL:self.url];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)savingPath {
    return [NSFileManager documentsPathWithFileName:self.fileName];
}

- (NSString *)fileName {
    return kFileName;
}

- (void)performLoading {
    TSYImageModelCache *cache = self.cache;
    NSURL *url = self.url;
    
    if ([cache containsImageModelWithURL:url]) {
        self.image = [cache imageModelWithURL:url];
    } else {
        UIImage *image = [UIImage imageWithContentsOfFile:self.savingPath];
    }
}

- (void)performDownloading {
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:self.url
                                                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
                                                    NSData *data = [NSData dataWithContentsOfURL:location];
                                                    
                                                    [[NSFileManager defaultManager] createFileAtPath:self.savingPath
                                                                                            contents:data
                                                                                          attributes:nil];
                                                    
                                                    self.state = TSYModelDidLoad;
                                                }];
    
    [task resume];
}

- (void)cancel {
    
}

@end

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
#import "NSURLSession+TSYCategory.h"

typedef void(^TSYLoadingCompletionHandler)(id location, id response, id error);

@interface TSYImageModel ()
@property (nonatomic, strong)   NSURL                       *url;
//@property (nonatomic, strong)   UIImage                     *image;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;
@property (nonatomic, readonly) TSYImageModelCache          *sharedCache;
@property (nonatomic, readonly) NSURLSession                *sharedSession;
@property (nonatomic, readonly) NSString                    *fileName;
@property (nonatomic, readonly) NSString                    *savingPath;

- (instancetype)initWithURL:(NSURL *)url;

- (BOOL)isImageCached;
- (UIImage *)cachedImage;

- (void)cancel;

- (TSYLoadingCompletionHandler)loadingCompletionHandler;

@end

@implementation TSYImageModel

@dynamic sharedCache;
@dynamic sharedSession;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    TSYImageModelCache *sharedCache = [TSYImageModelCache sharedCache];
    
    @synchronized (sharedCache) {
        if ([sharedCache containsImageModelWithURL:url]) {
            return [sharedCache imageModelWithURL:url];
        }
        
        TSYImageModel *imageModel = [[TSYImageModel alloc] initWithURL:url];
        [sharedCache addImageModel:imageModel withURL:url];
        
        return imageModel;
    }
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.downloadTask = nil;
    
    [self.sharedCache removeImageModelWithURL:self.url];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];

        _downloadTask = downloadTask;
        
        [_downloadTask resume];
    }
}

- (NSURLSession *)sharedSession {
    return [NSURLSession sharedEphemeralSessionForClass:[self class]];
}

- (TSYImageModelCache *)sharedCache {
    return [TSYImageModelCache sharedCache];
}

- (NSString *)fileName {
    NSString *fileName = [NSString stringWithFormat:@"%@%@", self.url.path, self.url.query];
    
    return [fileName stringByReplacingOccurrencesOfString:@":" withString:@""];
}

- (NSString *)savingPath {
    return [NSFileManager documentsPathWithFileName:self.fileName];
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoading {
    NSString *savingPath = self.savingPath;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![self isImageCached]) {
        [self performLoadingIfNeeded];
        
        return;
    }
    
    UIImage *cachedImage = [self cachedImage];
    
    if (!cachedImage) {
        [fileManager removeItemAtPath:savingPath
                                error:nil];
        
        [self performLoadingIfNeeded];
        
        return;
    }
    
    self.image = cachedImage;
    self.state = TSYModelDidLoad;
}

- (void)performLoadingIfNeeded {
    self.downloadTask = [self.sharedSession downloadTaskWithURL:self.url
                                              completionHandler:[self loadingCompletionHandler]];
}

#pragma mark -
#pragma mark Private Methods

- (BOOL)isImageCached {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return [fileManager fileExistsAtPath:self.savingPath];
}

- (UIImage *)cachedImage {
    return [UIImage imageWithContentsOfFile:self.savingPath];
}

- (TSYLoadingCompletionHandler)loadingCompletionHandler {
    NSString *savingPath = self.savingPath;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    TSYWeakify(self);
    TSYLoadingCompletionHandler handler = ^(NSURL *location, NSHTTPURLResponse *response, NSError *error) {
        TSYStrongify(self);
        
        if (200 != response.statusCode || nil != error) {
            self.state = TSYModelDidFailLoading;
            
            return;
        }
        
        UIImage *image = [UIImage imageWithContentsOfFile:location.path];
        
        if (image) {
            self.image = image;
            
            [fileManager copyItemAtURL:location
                                 toURL:[NSURL fileURLWithPath:savingPath]
                                 error:nil];
            
            self.state = TSYModelDidLoad;
        } else {
            self.state = TSYModelDidFailLoading;
        }
    };
    
    return handler;
}

- (void)cancel {
    self.downloadTask = nil;
}

@end

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

static const NSUInteger TSYImageModelSleepingTime    = 1;

typedef void(^TSYLoadingCompletionHandler)(id location, id response, id error);

@interface TSYImageModel ()
@property (nonatomic, strong)   TSYImageModelCache          *sharedCache;
@property (nonatomic, strong)   NSURLSession                *sharedSession;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;
@property (nonatomic, strong)   NSURL                       *url;
@property (nonatomic, readonly) NSString                    *fileName;
@property (nonatomic, strong)   UIImage                     *image;
@property (nonatomic, readonly) NSString                    *savingPath;

+ (NSURLSession *)sharedSession;

- (instancetype)initWithURL:(NSURL *)url;

- (BOOL)imageCached;
- (TSYLoadingCompletionHandler)loadingCompletionHandler;
- (void)cancel;

@end

@implementation TSYImageModel

@dynamic sharedCache;
@dynamic sharedSession;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    TSYSleep(TSYImageModelSleepingTime);
    
    TSYImageModelCache *sharedCache = [TSYImageModelCache sharedCache];
    
    if ([sharedCache containsImageModelWithURL:url]) {
        return [sharedCache imageModelWithURL:url];
    }
    
    TSYImageModel *imageModel = [[TSYImageModel alloc] initWithURL:url];
    [sharedCache addImageModel:imageModel withURL:url];
    
    return imageModel;
}

//+ (instancetype)imageModelWithURL:(NSURL *)url {
//    TSYImageModelCache *sharedCache = [TSYImageModelCache sharedCache];
//    TSYImageModel *imageModel = [sharedCache imageModelWithURL:url];
//    
//    if (!imageModel) {
//        imageModel = [[TSYImageModel alloc] initWithURL:url];
//        [sharedCache addImageModel:imageModel withURL:url];
//    }
//    
//    return imageModel;
//}

+ (NSURLSession *)sharedSession {
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    });
    
    return session;
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
    
//    return [TSYImageModel sharedSession];
}

- (TSYImageModelCache *)sharedCache {
    return [TSYImageModelCache sharedCache];
}

- (NSString *)fileName {
    return [NSString stringWithFormat:@"%@%@", self.url.path, self.url.query];
}

- (NSString *)savingPath {
    return [NSFileManager documentsPathWithFileName:self.fileName];
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoading {
    if (![self imageCached]) {
        self.downloadTask = [self.sharedSession downloadTaskWithURL:self.url
                                                  completionHandler:[self loadingCompletionHandler]];
    }
}

#pragma mark -
#pragma mark Private Methods

- (BOOL)imageCached {
    NSString *savingPath = self.savingPath;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:savingPath]) {
        UIImage *image = [UIImage imageWithContentsOfFile:savingPath];
        
        if (nil == image) {
            self.state = TSYModelDidFailLoading;
            return NO;
        }
        
        self.image = image;
        self.state = TSYModelDidLoad;
    }
    
    return YES;
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
        
        [fileManager copyItemAtURL:location
                             toURL:[NSURL fileURLWithPath:savingPath]
                             error:nil];
        
        UIImage *image = [UIImage imageWithContentsOfFile:savingPath];
        
        if (image) {
            self.image = image;
            
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

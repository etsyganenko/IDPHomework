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

@interface TSYImageModel ()
@property (nonatomic, strong)   TSYImageModelCache          *sharedCache;
@property (nonatomic, strong)   NSURLSession                *sharedSession;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;
@property (nonatomic, strong)   NSURL                       *url;
@property (nonatomic, readonly) NSString                    *fileName;
@property (nonatomic, strong)   UIImage                     *image;
@property (nonatomic, readonly) NSString                    *savingPath;

- (void)performDownloading;
- (void)cancel;

@end

@implementation TSYImageModel

@dynamic sharedCache;
@dynamic sharedSession;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

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
        
        TSYImageModelCache *sharedCache = self.sharedCache;
        if (![sharedCache containsImageModelWithURL:url]) {
            [sharedCache addImageModel:self withURL:url];
        }
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
//    return [NSURLSession sharedEphemeralSessionForClass:[self class]];
    
    return [TSYImageModel sharedSession];
}

- (TSYImageModelCache *)sharedCache {
    return [TSYImageModelCache sharedCache];
}

- (NSString *)fileName {
    return [NSString stringWithContentsOfURL:self.url encoding:NSUnicodeStringEncoding error:nil];
}

- (NSString *)savingPath {
    return [NSFileManager documentsPathWithFileName:self.fileName];
}

#pragma mark -
#pragma mark Private Methods












- (void)performLoading {
    NSURL *url = self.url;

    UIImage *image = [UIImage imageWithContentsOfFile:self.savingPath];
}

- (void)performDownloading {
    self.downloadTask = [self.sharedSession downloadTaskWithURL:self.url
                                                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
                                                    if (200 != ((NSHTTPURLResponse *)response).statusCode || nil != error) {
                                                        self.state = TSYModelDidFailLoading;
                                                        
                                                        return;
                                                    }
                                                    
                                                    [[NSFileManager defaultManager] copyItemAtURL:location
                                                                                            toURL:[NSURL URLWithString:self.savingPath]
                                                                                            error:nil];
                                                    
                                                    self.state = TSYModelDidLoad;
                                                }];
}

- (void)cancel {
    self.downloadTask = nil;
}

@end

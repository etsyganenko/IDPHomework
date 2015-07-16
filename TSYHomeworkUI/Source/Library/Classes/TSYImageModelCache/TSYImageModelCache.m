//
//  TSYImageModelCache.m
//  TSYHomeworkUI
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYImageModelCache.h"

#import "TSYImageModel.h"

@interface TSYImageModelCache ()
@property (nonatomic, strong)   NSMapTable     *imageModels;

- (void)clearCache;

@end

@implementation TSYImageModelCache

@dynamic count;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedCache {
    static TSYImageModelCache *cache = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [TSYImageModelCache new];
    });

    return cache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageModels = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.imageModels.count;
}

#pragma mark -
#pragma mark Public Methods

- (void)addImageModel:(TSYImageModel *)image withURL:(NSURL *)url {
    @synchronized (self) {
        [self.imageModels setObject:image forKey:url];
    }
}

- (void)removeImageModelWithURL:(NSURL *)url {
    @synchronized (self) {
        [self.imageModels removeObjectForKey:url];
    }
}

- (id)imageModelWithURL:(NSURL *)url {
    @synchronized (self) {
        return [self.imageModels objectForKey:url];
    }
}

- (BOOL)containsImageModelWithURL:(NSURL *)url {
    @synchronized (self) {
        return nil != [self.imageModels objectForKey:url];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)clearCache {
    @synchronized (self) {
        [self.imageModels removeAllObjects];
    }
}

@end

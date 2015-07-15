//
//  TSYCache.m
//  TSYHomeworkUI
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCache.h"

#import "TSYImageModel.h"

@interface TSYCache ()
@property (nonatomic, strong)   NSMapTable     *images;

@end

@implementation TSYCache

@dynamic count;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)cache {
    static TSYCache *cache = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [TSYCache new];
    });

    return cache;
    
    
//    if (nil == cache) {
//        cache = [TSYCache new];
//    }
//    
//    return cache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.images = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.images.count;
}

#pragma mark -
#pragma mark Public Methods

- (void)addImage:(id)image withURL:(NSURL *)url {
    @synchronized (self) {
        [self.images setObject:image forKey:url];
    }
}

- (void)removeImageWithURL:(NSURL *)url {
    @synchronized (self) {
        [self.images removeObjectForKey:url];
    }
}

- (id)imageWithURL:(NSURL *)url {
    @synchronized (self) {
        return [self.images objectForKey:url];
    }
}

- (BOOL)containsImageWithURL:(NSURL *)url {
    @synchronized (self) {
        return nil != [self.images objectForKey:url];
    }
}

- (void)clearCache {
    @synchronized (self) {
        [self.images removeAllObjects];
    }
}

@end

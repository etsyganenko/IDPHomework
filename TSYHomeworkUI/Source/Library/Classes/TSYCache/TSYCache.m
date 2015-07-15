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
@property (nonatomic, strong)   NSHashTable     *imageModels;

@end

@implementation TSYCache

@dynamic count;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)cache {
    return [TSYCache new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageModels = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return [self.imageModels count];
}

#pragma mark -
#pragma mark Public Methods

- (void)addImageModel:(TSYImageModel *)imageModel {
    @synchronized (self) {
        [self.imageModels addObject:imageModel];
    }
}

- (void)removeImageModel:(TSYImageModel *)imageModel {
    @synchronized (self) {
        [self.imageModels removeObject:imageModel];
    }
}

- (TSYImageModel *)imageModelWithURL:(NSURL *)url {
    return nil;
}

- (BOOL)containsImageModelWithURL:(NSURL *)url {
    return NO;
}

- (void)clearCache {
    @synchronized (self) {
        [self.imageModels removeAllObjects];
    }
}

@end

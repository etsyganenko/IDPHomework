//
//  TSYCache.h
//  TSYHomeworkUI
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSYImageModel;

@interface TSYCache : NSObject
@property (nonatomic, readonly) NSUInteger  count;

+ (instancetype)cache;

- (void)addImage:(id)image withURL:(NSURL *)url;
- (void)removeImageWithURL:(NSURL *)url;

- (id)imageWithURL:(NSURL *)url;

- (BOOL)containsImageWithURL:(NSURL *)url;

- (void)clearCache;

@end

//
//  TSYImageModelCache.h
//  TSYHomeworkUI
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSYImageModel;

@interface TSYImageModelCache : NSObject
@property (nonatomic, readonly) NSUInteger  count;

+ (instancetype)sharedCache;

- (void)addImageModel:(TSYImageModel *)image withURL:(NSURL *)url;
- (void)removeImageModelWithURL:(NSURL *)url;

- (id)imageModelWithURL:(NSURL *)url;

- (BOOL)containsImageModelWithURL:(NSURL *)url;

@end

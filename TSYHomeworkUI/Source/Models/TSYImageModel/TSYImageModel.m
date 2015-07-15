//
//  TSYImageModel.m
//  TSYHomeworkUI
//
//  Created by Admin on 14.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYImageModel.h"

#import "TSYCache.h"

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

- (void)load {
    
}

@end

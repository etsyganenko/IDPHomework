//
//  TSYFBUserAlbumModel.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFBUserAlbumModel.h"

#import "TSYArrayModel.h"

@implementation TSYFBUserAlbumModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.photos = [NSMutableDictionary dictionary];
        self.photos = [TSYArrayModel array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark TSYObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYModelDidLoad:
            return @selector(modelDidLoad:);
            
        case TSYModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        default:
            return [super selectorForState:state];;
    }
}

@end

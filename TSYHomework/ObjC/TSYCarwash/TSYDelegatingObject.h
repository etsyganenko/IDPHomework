//
//  TSYDelegatingObject.h
//  TSYHomework
//
//  Created by Admin on 09.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSYDelegatingObject <NSObject>
@property (nonatomic, assign)                   id<TSYDelegatingObject>     delegate;
@property (nonatomic, assign, getter=isFree)    BOOL                        free;

- (void)delegatingObjectDidFinishWork:(id<TSYDelegatingObject>)object;

@end

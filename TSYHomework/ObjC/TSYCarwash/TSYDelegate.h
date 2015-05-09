//
//  TSYDelegate.h
//  TSYHomework
//
//  Created by Admin on 09.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSYDelegate <NSObject>
@property (nonatomic, assign)   id<TSYDelegate> delegatingObject;

@end

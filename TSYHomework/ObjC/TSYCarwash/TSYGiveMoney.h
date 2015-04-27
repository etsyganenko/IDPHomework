//
//  TSYGiveMoney.h
//  TSYHomework
//
//  Created by Admin on 22.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSYGiveMoney <NSObject>
- (void)giveMoney:(NSUInteger)money toObject:(id<TSYGiveMoney>)object;

@end

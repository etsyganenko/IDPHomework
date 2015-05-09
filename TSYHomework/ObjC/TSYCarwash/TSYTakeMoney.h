//
//  TSYTakeMoney.h
//  TSYHomework
//
//  Created by Admin on 22.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSYTakeMoney <NSObject>
- (void)takeMoney:(NSUInteger)money fromObject:(id)object;

@end

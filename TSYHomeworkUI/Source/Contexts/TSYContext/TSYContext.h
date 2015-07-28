//
//  TSYContext.h
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYContext : NSObject
@property (nonatomic, strong)   id    model;

- (void)execute;
- (void)cancel;

- (void)fillModelWithResult:(id)result;

@end
